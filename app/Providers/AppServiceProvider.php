<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use Illuminate\Support\Facades\Schema;

use Illuminate\Support\Facades\URL;

class

AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
    }

    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        Schema::defaultStringLength(191);

        if(config('app.env') !== 'local') {
            URL::forceScheme('https');
        }

        $root = request()->root();
        if ($root !== 'http://localhost' && $root !== 'http://127.0.0.1') {
            $this->app['url']->forceRootUrl($root);
        }
    }
}
