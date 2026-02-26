<?php

// ============================
// CONFIG — change these!
// ============================
define('SECRET', 'Moon007!');
define('BASE',    dirname(__DIR__));

// ============================
// AUTH
// ============================
session_start();

if (isset($_POST['auth_password'])) {
    if ($_POST['auth_password'] === SECRET) {
        $_SESSION['devpanel_auth'] = true;
    } else {
        $authError = 'Wrong password!';
    }
}

if (isset($_GET['logout'])) {
    session_destroy();
    header('Location: devpanel.php');
    exit;
}

if (!isset($_SESSION['devpanel_auth'])) {
    ?>
    <!DOCTYPE html>
    <html>
    <head>
        <title>DevPanel Login</title>
        <style>
            * { margin:0;padding:0;box-sizing:border-box; }
            body { background:#0d1117;display:flex;justify-content:center;align-items:center;height:100vh;font-family:monospace; }
            .box { background:#161b22;border:1px solid #30363d;border-radius:10px;padding:40px;width:320px;display:flex;flex-direction:column;gap:16px; }
            h2 { color:#c9d1d9;text-align:center; }
            input[type=password] { background:#0d1117;border:1px solid #30363d;color:#c9d1d9;padding:10px;border-radius:6px;font-size:14px;width:100%; }
            button { background:#238636;color:#fff;border:none;padding:10px;border-radius:6px;cursor:pointer;font-size:14px; }
            button:hover { background:#2ea043; }
            .error { color:#f85149;font-size:13px;text-align:center; }
        </style>
    </head>
    <body>
        <div class="box">
            <h2>🔒 DevPanel</h2>
            <?php if (!empty($authError)) echo "<div class='error'>{$authError}</div>"; ?>
            <form method="POST">
                <div style="display:flex;flex-direction:column;gap:10px;">
                    <input type="password" name="auth_password" placeholder="Enter password" autofocus />
                    <button type="submit">Login</button>
                </div>
            </form>
        </div>
    </body>
    </html>
    <?php
    exit;
}

// ============================
// API HANDLERS
// ============================
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_GET['api'])) {
    header('Content-Type: application/json');
    $body = json_decode(file_get_contents('php://input'), true);

    switch ($_GET['api']) {

        // --- Artisan ---
        case 'artisan':
            $cmd = preg_replace('/^(php\s+)?artisan\s+/', '', $body['command']);
            ob_start();
            try {
                require BASE . '/vendor/autoload.php';
                $app     = require BASE . '/bootstrap/app.php';
                $kernel  = $app->make(Illuminate\Contracts\Console\Kernel::class);
                $output  = new Symfony\Component\Console\Output\BufferedOutput;
                $kernel->call($cmd, [], $output);
                echo $output->fetch();
                $status = 'success';
            } catch (Exception $e) {
                echo $e->getMessage();
                $status = 'error';
            }
            $out = ob_get_clean();
            echo json_encode(['output' => $out ?: '(no output)', 'status' => $status]);
            break;

        // --- .env Read ---
        case 'env_read':
            echo json_encode(['env' => file_get_contents(BASE . '/.env')]);
            break;

        // --- .env Write ---
        case 'env_write':
            file_put_contents(BASE . '/.env', $body['content']);
            shell_exec('php ' . BASE . '/artisan config:clear 2>&1');
            echo json_encode(['status' => 'success', 'message' => '.env saved & config cleared!']);
            break;

        // --- Permissions Read ---
        case 'perms_read':
            $paths = [
                'storage/app'       => BASE . '/storage/app',
                'storage/framework' => BASE . '/storage/framework',
                'storage/logs'      => BASE . '/storage/logs',
                'bootstrap/cache'   => BASE . '/bootstrap/cache',
                '.env'              => BASE . '/.env',
                'public'            => BASE . '/public',
            ];
            $result = [];
            foreach ($paths as $label => $path) {
                $result[] = [
                    'path'     => $label,
                    'perms'    => file_exists($path) ? substr(sprintf('%o', fileperms($path)), -4) : 'N/A',
                    'owner'    => file_exists($path) ? (function_exists('posix_getpwuid') ? posix_getpwuid(fileowner($path))['name'] : fileowner($path)) : 'N/A',
                    'writable' => is_writable($path),
                ];
            }
            echo json_encode($result);
            break;

        // --- Permissions Write ---
        case 'perms_write':
            $allowed = [
                'storage'         => BASE . '/storage',
                'bootstrap/cache' => BASE . '/bootstrap/cache',
                '.env'            => BASE . '/.env',
                'public'          => BASE . '/public',
            ];
            $target = $body['target'];
            $mode   = octdec($body['mode']);
            if (!array_key_exists($target, $allowed)) {
                echo json_encode(['status' => 'error', 'message' => 'Path not allowed!']);
                break;
            }
            $path = $allowed[$target];
            if ($body['recursive'] && is_dir($path)) {
                $it = new RecursiveIteratorIterator(new RecursiveDirectoryIterator($path, RecursiveDirectoryIterator::SKIP_DOTS));
                foreach ($it as $item) chmod($item->getPathname(), $mode);
            }
            chmod($path, $mode);
            echo json_encode(['status' => 'success', 'message' => "chmod {$body['mode']} applied to {$target}"]);
            break;

        // --- Permissions Fix ---
        case 'perms_fix':
            $storage   = BASE . '/storage';
            $bootstrap = BASE . '/bootstrap/cache';
            $it = new RecursiveIteratorIterator(new RecursiveDirectoryIterator($storage, RecursiveDirectoryIterator::SKIP_DOTS));
            foreach ($it as $item) chmod($item->getPathname(), 0775);
            chmod($storage, 0775);
            chmod($bootstrap, 0775);
            echo json_encode(['status' => 'success', 'message' => '✅ storage/ and bootstrap/cache set to 775']);
            break;

        // --- Shell ---
        case 'shell':
            $cmd = $body['command'];
            $cwd = $body['cwd'] ?? BASE;
            $blacklist = ['rm -rf /', 'mkfs', 'shutdown', 'reboot', 'halt', 'poweroff', ':(){ :|:& };:'];
            foreach ($blacklist as $danger) {
                if (str_contains($cmd, $danger)) {
                    echo json_encode(['output' => '🚫 Blocked!', 'cwd' => $cwd, 'status' => 'error']);
                    exit;
                }
            }
            $output = shell_exec("cd " . escapeshellarg($cwd) . " && " . $cmd . " 2>&1");
            $newCwd = $cwd;
            if (preg_match('/^\s*cd\s+(.+)/', $cmd, $m)) {
                $resolved = realpath($cwd . '/' . trim($m[1]));
                if ($resolved && is_dir($resolved)) $newCwd = $resolved;
            }
            echo json_encode(['output' => $output ?: '(no output)', 'cwd' => $newCwd, 'status' => 'success']);
            break;

        // --- Docker ---
        case 'docker':
            $cmd = preg_replace('/^\s*docker\s+/', '', $body['command']);
            $blacklist = ['rm -f', 'rmi -f', 'system prune -a', 'swarm leave', 'volume rm'];
            foreach ($blacklist as $danger) {
                if (str_contains($cmd, $danger)) {
                    echo json_encode(['output' => '🚫 Blocked!', 'status' => 'error']);
                    exit;
                }
            }
            $output = shell_exec('docker ' . $cmd . ' 2>&1');
            echo json_encode(['output' => $output ?: '(no output)', 'status' => 'success']);
            break;

        // --- Docker Containers ---
        case 'docker_containers':
            $output = shell_exec('docker ps -a --format "{{json .}}" 2>&1');
            $lines  = array_filter(explode("\n", trim($output)));
            $containers = array_map(fn($l) => json_decode($l, true), $lines);
            echo json_encode(['containers' => array_values(array_filter($containers))]);
            break;

        // --- Docker Action ---
        case 'docker_action':
            $action = $body['action'];
            $id     = $body['container_id'];
            $allowed = ['start', 'stop', 'restart', 'logs --tail=100', 'inspect', 'stats --no-stream'];
            $ok = false;
            foreach ($allowed as $a) {
                if (str_starts_with($action, explode(' ', $a)[0])) { $ok = true; break; }
            }
            if (!$ok) {
                echo json_encode(['output' => '🚫 Not allowed!', 'status' => 'error']);
                exit;
            }
            $output = shell_exec("docker {$action} {$id} 2>&1");
            echo json_encode(['output' => $output ?: '(no output)', 'status' => 'success']);
            break;
    }
    exit;
}
?>
<!DOCTYPE html>
<html>
<head>
    <title>DevPanel</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
        * { margin:0;padding:0;box-sizing:border-box; }
        body { background:#0d1117;color:#c9d1d9;font-family:'Courier New',monospace;height:100vh;display:flex;flex-direction:column;overflow:hidden; }
        #tabs { display:flex;background:#161b22;border-bottom:1px solid #30363d;flex-shrink:0;overflow-x:auto; }
        .tab { padding:10px 20px;cursor:pointer;color:#8b949e;font-size:13px;border-bottom:2px solid transparent;white-space:nowrap; }
        .tab.active { color:#c9d1d9;border-bottom:2px solid #238636; }
        .tab:hover { color:#c9d1d9; }
        .panel { display:none;flex:1;flex-direction:column;overflow:hidden;min-height:0; }
        .panel.active { display:flex; }
        .output { flex:1;padding:16px;overflow-y:auto;white-space:pre-wrap;word-break:break-word;font-size:13px;min-height:0; }
        .input-bar { display:flex;align-items:center;padding:10px 14px;border-top:1px solid #30363d;background:#161b22;gap:8px;flex-shrink:0; }
        .input-bar input { flex:1;background:transparent;border:none;outline:none;color:#c9d1d9;font-family:'Courier New',monospace;font-size:13px; }
        .btn { border:none;padding:6px 14px;border-radius:6px;cursor:pointer;font-size:13px;color:#fff; }
        .btn-green { background:#238636; } .btn-green:hover { background:#2ea043; }
        .btn-blue  { background:#1f6feb; } .btn-blue:hover  { background:#388bfd; }
        .btn-gray  { background:#21262d;color:#c9d1d9;border:1px solid #30363d; }
        .btn-gray:hover { background:#30363d; }
        .toolbar { display:flex;gap:6px;padding:8px 14px;background:#161b22;border-bottom:1px solid #30363d;flex-wrap:wrap;flex-shrink:0; }
        .quick { background:#21262d;color:#c9d1d9;border:1px solid #30363d;padding:3px 9px;border-radius:4px;cursor:pointer;font-size:11px;font-family:'Courier New',monospace; }
        .quick:hover { background:#30363d; }
        .s-ok  { color:#3fb950; }
        .s-err { color:#f85149; }
        .s-cmd { color:#58a6ff; }
        .s-info{ color:#8b949e; }

        /* env panel */
        #env-panel { padding:16px;gap:12px; }
        #env-editor { flex:1;background:#0d1117;color:#c9d1d9;border:1px solid #30363d;border-radius:6px;padding:12px;font-family:'Courier New',monospace;font-size:12px;resize:none;min-height:0; }

        /* perms panel */
        .perm-table { width:100%;border-collapse:collapse;font-size:12px; }
        .perm-table th { color:#8b949e;text-align:left;padding:8px 12px;border-bottom:1px solid #30363d; }
        .perm-table td { padding:8px 12px;border-bottom:1px solid #21262d; }
        .perm-controls { padding:12px 14px;border-bottom:1px solid #30363d;display:flex;gap:10px;align-items:center;flex-wrap:wrap;flex-shrink:0;background:#161b22; }
        select { background:#0d1117;color:#c9d1d9;border:1px solid #30363d;padding:5px 8px;border-radius:6px;font-size:12px; }

        /* docker panel */
        .container-card { display:flex;align-items:center;gap:10px;background:#161b22;padding:8px 12px;border-radius:6px;border:1px solid #30363d;flex-wrap:wrap;font-size:12px; }
        .daction { color:#fff;border:none;padding:2px 8px;border-radius:4px;cursor:pointer;font-size:11px; }
        .daction:hover { opacity:0.85; }
    </style>
</head>
<body>

<!-- Tabs -->
<div id="tabs">
    <div class="tab active"  onclick="switchTab('artisan')">⚡ Artisan</div>
    <div class="tab"         onclick="switchTab('env')">⚙️ .env</div>
    <div class="tab"         onclick="switchTab('perms')">🔒 Perms</div>
    <div class="tab"         onclick="switchTab('shell')">💻 Shell</div>
    <div class="tab"         onclick="switchTab('docker')">🐳 Docker</div>
    <div style="margin-left:auto;padding:10px 14px;flex-shrink:0;">
        <a href="?logout" style="color:#f85149;font-size:12px;text-decoration:none;">Logout</a>
    </div>
</div>

<!-- ⚡ Artisan Panel -->
<div id="artisan-panel" class="panel active">
    <div class="toolbar">
        <button class="quick" data-tab="artisan" data-cmd="migrate">migrate</button>
        <button class="quick" data-tab="artisan" data-cmd="migrate:rollback">rollback</button>
        <button class="quick" data-tab="artisan" data-cmd="migrate:fresh --seed">fresh --seed</button>
        <button class="quick" data-tab="artisan" data-cmd="cache:clear">cache:clear</button>
        <button class="quick" data-tab="artisan" data-cmd="config:clear">config:clear</button>
        <button class="quick" data-tab="artisan" data-cmd="config:cache">config:cache</button>
        <button class="quick" data-tab="artisan" data-cmd="route:list">route:list</button>
        <button class="quick" data-tab="artisan" data-cmd="queue:work">queue:work</button>
        <button class="quick" data-tab="artisan" data-cmd="storage:link">storage:link</button>
        <button class="quick" data-tab="artisan" data-cmd="optimize:clear">optimize:clear</button>
        <button class="quick" data-tab="artisan" data-cmd="about">about</button>
    </div>
    <div id="artisan-output" class="output"><span class="s-info">⚡ Artisan ready. Type any artisan command below.
</span></div>
    <div class="input-bar">
        <span style="color:#3fb950;white-space:nowrap;">php artisan $</span>
        <input id="artisan-cmd" type="text" placeholder="migrate, make:model Post, route:list ..." autocomplete="off" />
        <button class="btn btn-green" onclick="runArtisan()">Run</button>
        <button class="btn btn-gray"  onclick="clearOutput('artisan-output')">Clear</button>
    </div>
</div>

<!-- ⚙️ .env Panel -->
<div id="env-panel" class="panel" style="padding:16px;gap:12px;">
    <div style="display:flex;gap:10px;align-items:center;flex-shrink:0;">
        <button class="btn btn-green" onclick="saveEnv()">💾 Save .env</button>
        <button class="btn btn-gray"  onclick="loadEnv()">🔄 Reload</button>
        <span id="env-msg" style="font-size:12px;"></span>
    </div>
    <textarea id="env-editor" spellcheck="false"></textarea>
</div>

<!-- 🔒 Perms Panel -->
<div id="perms-panel" class="panel" style="flex-direction:column;">
    <div class="perm-controls">
        <button class="btn btn-green" onclick="fixPerms()">⚡ Fix Laravel Perms</button>
        <button class="btn btn-gray"  onclick="loadPerms()">🔄 Refresh</button>
        <select id="perm-target">
            <option value="storage">storage/</option>
            <option value="bootstrap/cache">bootstrap/cache</option>
            <option value=".env">.env</option>
            <option value="public">public/</option>
        </select>
        <select id="perm-mode">
            <option value="775">775</option>
            <option value="755">755</option>
            <option value="777">777</option>
            <option value="644">644</option>
            <option value="600">600</option>
        </select>
        <label style="font-size:12px;display:flex;align-items:center;gap:4px;">
            <input type="checkbox" id="perm-recursive" checked /> Recursive
        </label>
        <button class="btn btn-blue" onclick="applyChmod()">Apply chmod</button>
        <span id="perm-msg" style="font-size:12px;"></span>
    </div>
    <div style="overflow-y:auto;flex:1;">
        <table class="perm-table">
            <thead><tr><th>Path</th><th>Perms</th><th>Owner</th><th>Writable</th></tr></thead>
            <tbody id="perm-tbody"></tbody>
        </table>
    </div>
</div>

<!-- 💻 Shell Panel -->
<div id="shell-panel" class="panel">
    <div class="toolbar">
        <button class="quick" data-tab="shell" data-cmd="ls -la">ls -la</button>
        <button class="quick" data-tab="shell" data-cmd="pwd">pwd</button>
        <button class="quick" data-tab="shell" data-cmd="composer install">composer install</button>
        <button class="quick" data-tab="shell" data-cmd="composer dump-autoload">dump-autoload</button>
        <button class="quick" data-tab="shell" data-cmd="npm install">npm install</button>
        <button class="quick" data-tab="shell" data-cmd="npm run build">npm run build</button>
        <button class="quick" data-tab="shell" data-cmd="git status">git status</button>
        <button class="quick" data-tab="shell" data-cmd="git pull">git pull</button>
        <button class="quick" data-tab="shell" data-cmd="df -h">disk</button>
        <button class="quick" data-tab="shell" data-cmd="free -h">memory</button>
        <button class="quick" data-tab="shell" data-cmd="ps aux">processes</button>
    </div>
    <div id="shell-output" class="output"><span class="s-info">💻 Shell ready.
</span></div>
    <div class="input-bar">
        <span id="shell-prompt" style="color:#3fb950;white-space:nowrap;">$ </span>
        <input id="shell-cmd" type="text" placeholder="any bash command ..." autocomplete="off" />
        <button class="btn btn-green" onclick="runShell()">Run</button>
        <button class="btn btn-gray"  onclick="clearOutput('shell-output')">Clear</button>
    </div>
</div>

<!-- 🐳 Docker Panel -->
<div id="docker-panel" class="panel" style="flex-direction:column;">
    <div style="padding:12px 14px;border-bottom:1px solid #30363d;flex-shrink:0;background:#0d1117;">
        <div style="display:flex;justify-content:space-between;align-items:center;margin-bottom:10px;">
            <span style="font-size:13px;">🐳 Containers</span>
            <button class="btn btn-gray" style="font-size:11px;padding:4px 10px;" onclick="loadContainers()">🔄 Refresh</button>
        </div>
        <div id="container-list" style="display:flex;flex-direction:column;gap:6px;max-height:180px;overflow-y:auto;"></div>
    </div>
    <div class="toolbar">
        <button class="quick" data-tab="docker" data-cmd="ps">ps</button>
        <button class="quick" data-tab="docker" data-cmd="ps -a">ps -a</button>
        <button class="quick" data-tab="docker" data-cmd="images">images</button>
        <button class="quick" data-tab="docker" data-cmd="network ls">network ls</button>
        <button class="quick" data-tab="docker" data-cmd="volume ls">volume ls</button>
        <button class="quick" data-tab="docker" data-cmd="stats --no-stream">stats</button>
        <button class="quick" data-tab="docker" data-cmd="compose ps">compose ps</button>
        <button class="quick" data-tab="docker" data-cmd="compose logs --tail=50">compose logs</button>
        <button class="quick" data-tab="docker" data-cmd="compose up -d">compose up -d</button>
        <button class="quick" data-tab="docker" data-cmd="compose down">compose down</button>
        <button class="quick" data-tab="docker" data-cmd="compose restart">compose restart</button>
        <button class="quick" data-tab="docker" data-cmd="system df">system df</button>
    </div>
    <div id="docker-output" class="output"><span class="s-info">🐳 Docker ready.
</span></div>
    <div class="input-bar">
        <span style="color:#1d6fa4;white-space:nowrap;">docker $</span>
        <input id="docker-cmd" type="text" placeholder="ps, logs app, exec -it app bash ..." autocomplete="off" />
        <button class="btn btn-blue" onclick="runDocker()">Run</button>
        <button class="btn btn-gray"  onclick="clearOutput('docker-output')">Clear</button>
    </div>
</div>

<script>
const BASE_URL = 'devpanel.php';

// =====================
// Utilities
// =====================
function api(endpoint, data) {
    return fetch(BASE_URL + '?api=' + endpoint, {
        method: data !== undefined ? 'POST' : 'GET',
        headers: { 'Content-Type': 'application/json' },
        body: data !== undefined ? JSON.stringify(data) : null
    }).then(r => r.json());
}

function append(outputId, text, cls) {
    const out  = document.getElementById(outputId);
    const span = document.createElement('span');
    span.className   = cls;
    span.textContent = text + '\n';
    out.appendChild(span);
    out.scrollTop = out.scrollHeight;
}

function clearOutput(id) {
    document.getElementById(id).innerHTML = '';
}

function showMsg(id, text, ok) {
    const el = document.getElementById(id);
    el.textContent = text;
    el.style.color = ok ? '#3fb950' : '#f85149';
}

// =====================
// Tab Switching
// =====================
function switchTab(tab) {
    const names = ['artisan','env','perms','shell','docker'];
    document.querySelectorAll('.tab').forEach((t, i) => {
        t.classList.toggle('active', names[i] === tab);
    });
    document.querySelectorAll('.panel').forEach(p => p.classList.remove('active'));
    document.getElementById(tab + '-panel').classList.add('active');
    if (tab === 'env')    loadEnv();
    if (tab === 'perms')  loadPerms();
    if (tab === 'docker') loadContainers();
}

// =====================
// Command History Helper
// =====================
function makeHistory(inputId) {
    const h = { list: [], idx: -1 };
    document.getElementById(inputId).addEventListener('keydown', function(e) {
        if (e.key === 'ArrowUp') {
            e.preventDefault();
            if (h.idx < h.list.length - 1) this.value = h.list[++h.idx];
        } else if (e.key === 'ArrowDown') {
            e.preventDefault();
            this.value = h.idx > 0 ? h.list[--h.idx] : (h.idx = -1, '');
        }
    });
    return h;
}

const artisanHist = makeHistory('artisan-cmd');
const shellHist   = makeHistory('shell-cmd');
const dockerHist  = makeHistory('docker-cmd');

// =====================
// ⚡ Artisan
// =====================
async function runArtisan(cmd) {
    const input   = document.getElementById('artisan-cmd');
    const command = cmd !== undefined ? cmd : input.value.trim();
    if (!command) return;
    artisanHist.list.unshift(command);
    artisanHist.idx = -1;
    append('artisan-output', 'php artisan ' + command, 's-cmd');
    if (cmd === undefined) input.value = '';
    const data = await api('artisan', { command });
    append('artisan-output', data.output, data.status === 'success' ? 's-ok' : 's-err');
    input.focus();
}

document.getElementById('artisan-cmd').addEventListener('keydown', function(e) {
    if (e.key === 'Enter') runArtisan();
});

// =====================
// ⚙️ .env
// =====================
async function loadEnv() {
    const data = await api('env_read');
    document.getElementById('env-editor').value = data.env;
}

async function saveEnv() {
    const content = document.getElementById('env-editor').value;
    showMsg('env-msg', 'Saving...', true);
    const data = await api('env_write', { content });
    showMsg('env-msg', data.message, data.status === 'success');
}

// =====================
// 🔒 Permissions
// =====================
async function loadPerms() {
    const data  = await api('perms_read');
    const tbody = document.getElementById('perm-tbody');
    tbody.innerHTML = '';
    data.forEach(function(r) {
        const tr = document.createElement('tr');
        tr.innerHTML =
            '<td style="color:#58a6ff;">' + r.path + '</td>' +
            '<td>' + r.perms + '</td>' +
            '<td>' + r.owner + '</td>' +
            '<td style="color:' + (r.writable ? '#3fb950' : '#f85149') + '">' + (r.writable ? '✅ Yes' : '❌ No') + '</td>';
        tbody.appendChild(tr);
    });
}

async function fixPerms() {
    showMsg('perm-msg', 'Fixing...', true);
    const data = await api('perms_fix', {});
    showMsg('perm-msg', data.message, data.status === 'success');
    loadPerms();
}

async function applyChmod() {
    const data = await api('perms_write', {
        target    : document.getElementById('perm-target').value,
        mode      : document.getElementById('perm-mode').value,
        recursive : document.getElementById('perm-recursive').checked,
    });
    showMsg('perm-msg', data.message, data.status === 'success');
    loadPerms();
}

// =====================
// 💻 Shell
// =====================
var shellCwd = '<?= addslashes(dirname(__DIR__)) ?>';

async function runShell(cmd) {
    const input   = document.getElementById('shell-cmd');
    const command = cmd !== undefined ? cmd : input.value.trim();
    if (!command) return;
    shellHist.list.unshift(command);
    shellHist.idx = -1;
    append('shell-output', shellCwd + ' $ ' + command, 's-cmd');
    if (cmd === undefined) input.value = '';
    const data = await api('shell', { command: command, cwd: shellCwd });
    shellCwd = data.cwd;
    document.getElementById('shell-prompt').textContent = shellCwd + ' $ ';
    append('shell-output', data.output, 's-ok');
    input.focus();
}

document.getElementById('shell-cmd').addEventListener('keydown', function(e) {
    if (e.key === 'Enter') runShell();
});

// =====================
// 🐳 Docker
// =====================
async function runDocker(cmd) {
    const input   = document.getElementById('docker-cmd');
    const command = cmd !== undefined ? cmd : input.value.trim();
    if (!command) return;
    dockerHist.list.unshift(command);
    dockerHist.idx = -1;
    append('docker-output', 'docker ' + command, 's-cmd');
    if (cmd === undefined) input.value = '';
    const data = await api('docker', { command: command });
    append('docker-output', data.output, data.status === 'success' ? 's-ok' : 's-err');
    input.focus();
}

document.getElementById('docker-cmd').addEventListener('keydown', function(e) {
    if (e.key === 'Enter') runDocker();
});

async function loadContainers() {
    const list = document.getElementById('container-list');
    list.innerHTML = '<span style="color:#8b949e;font-size:12px;">Loading...</span>';
    const data = await api('docker_containers');
    if (!data.containers || !data.containers.length) {
        list.innerHTML = '<span style="color:#8b949e;font-size:12px;">No containers found or Docker not available.</span>';
        return;
    }
    list.innerHTML = '';
    data.containers.forEach(function(c) {
        if (!c) return;
        const running = c.Status && c.Status.startsWith('Up');
        const div = document.createElement('div');
        div.className = 'container-card';
        div.innerHTML =
            '<span>' + (running ? '🟢' : '🔴') + '</span>' +
            '<span style="color:#58a6ff;min-width:120px;">' + (c.Names || c.ID) + '</span>' +
            '<span style="color:#8b949e;flex:1;">' + c.Image + '</span>' +
            '<span style="color:' + (running ? '#3fb950' : '#f85149') + ';min-width:80px;">' + c.Status + '</span>' +
            '<div style="display:flex;gap:4px;">' +
                (running  ? '<button class="daction" style="background:#9a6700" onclick="cAction(\'restart\',\'' + c.ID + '\')">↺</button>' : '') +
                (running  ? '<button class="daction" style="background:#b91c1c" onclick="cAction(\'stop\',\'' + c.ID + '\')">■</button>' : '') +
                (!running ? '<button class="daction" style="background:#166534" onclick="cAction(\'start\',\'' + c.ID + '\')">▶</button>' : '') +
                '<button class="daction" style="background:#1f6feb" onclick="cAction(\'logs --tail=100\',\'' + c.ID + '\')">logs</button>' +
                '<button class="daction" style="background:#21262d;border:1px solid #30363d;" onclick="cAction(\'stats --no-stream\',\'' + c.ID + '\')">stats</button>' +
            '</div>';
        list.appendChild(div);
    });
}

async function cAction(action, id) {
    append('docker-output', 'docker ' + action + ' ' + id, 's-cmd');
    const data = await api('docker_action', { action: action, container_id: id });
    append('docker-output', data.output, data.status === 'success' ? 's-ok' : 's-err');
    if (['start','stop','restart'].some(function(a) { return action.startsWith(a); })) {
        setTimeout(loadContainers, 1200);
    }
}

// =====================
// Quick buttons (all tabs)
// =====================
document.querySelectorAll('.quick[data-tab]').forEach(function(btn) {
    btn.addEventListener('click', function() {
        var tab = btn.dataset.tab;
        var cmd = btn.dataset.cmd;
        if (tab === 'artisan') runArtisan(cmd);
        if (tab === 'shell')   runShell(cmd);
        if (tab === 'docker')  runDocker(cmd);
    });
});
</script>
</body>
</html>
