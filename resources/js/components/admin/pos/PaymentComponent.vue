<template>
    <LoadingComponent :props="loading" />

    <div v-if="show" style="position:absolute;top:0;left:0;width:100%;height:100%;background:#fff;z-index:9999;display:flex;flex-direction:column;border-radius:12px;border:1px solid #D9DBE9;overflow:hidden;">
        <!-- Header -->
        <div style="display:flex;align-items:center;justify-content:space-between;padding:16px 20px;border-bottom:1px solid #D9DBE9;background:#f8f9fa;position:sticky;top:0;">
            <button @click="reset" style="background:#6c757d;color:#fff;border:none;border-radius:8px;padding:8px 16px;font-size:14px;font-weight:600;cursor:pointer;">
                ← Back
            </button>
            <h3 class="capitalize font-medium">{{ $t('label.order_payment') }}</h3>
            <div style="width:80px;"></div>
        </div>

        <!-- Body -->
        <div style="flex:1;overflow-y:auto;padding:20px;max-width:428px;width:100%;margin:0 auto;">

            <!-- Total Amount -->
            <div class="mb-4">
                <div class="flex justify-between items-center h-12 w-full rounded-lg py-1.5 px-2 placeholder:text-[10px] placeholder:text-[#6E7191] bg-[#F7F7FC]">
                    <span class="text-sm font-normal text-[#2E2F38]">{{ $t('label.total_amount') }}</span>
                    <span class="text-primary text-base font-medium">{{
                        currencyFormat(props.form.total,
                            setting.site_digit_after_decimal_point, setting.site_default_currency_symbol,
                            setting.site_currency_position)
                    }}</span>
                </div>
            </div>

            <!-- Payment Method Selector -->
            <div class="mb-4">
                <h3 class="capitalize font-medium mb-2">{{ $t('label.select_payment_method') }}</h3>
                <nav class="flex flex-wrap gap-4 active-group">
                    <button data-tab="#cash" type="button"
                        class="other-tabBtn w-fit flex flex-col items-center gap-2 rounded-lg py-3 px-7 border bg-[#F7F7FC] border-[#F7F7FC]"
                        :class="props.form.pos_payment_method === posPaymentMethodEnum.CASH && !isSplitMode ? 'active' : ''"
                        @click="paymentMethod(posPaymentMethodEnum.CASH, 'cashInput')">
                        <i class="lab lab-cash lab-font-size-24"></i>
                        <span class="text-xs font-normal leading-none text-heading">{{ $t("label.cash") }}</span>
                    </button>
                    <button data-tab="#card" type="button"
                        class="other-tabBtn w-fit flex flex-col items-center gap-2 rounded-lg py-3 px-7 border bg-[#F7F7FC] border-[#F7F7FC]"
                        :class="props.form.pos_payment_method === posPaymentMethodEnum.CARD && !isSplitMode ? 'active' : ''"
                        @click="paymentMethod(posPaymentMethodEnum.CARD, 'cardInput')">
                        <i class="lab lab-card-2 lab-font-size-24"></i>
                        <span class="text-xs font-normal leading-none text-heading">{{ $t("label.card") }}</span>
                    </button>
                    <button data-tab="#mfs" type="button" onclick="createkeyboard('mfs')"
                        class="other-tabBtn w-fit flex flex-col items-center gap-2 rounded-lg py-3 px-7 border bg-[#F7F7FC] border-[#F7F7FC]"
                        :class="props.form.pos_payment_method === posPaymentMethodEnum.MOBILE_BANKING && !isSplitMode ? 'active' : ''"
                        @click="paymentMethod(posPaymentMethodEnum.MOBILE_BANKING)">
                        <i class="lab lab-mfs lab-font-size-24"></i>
                        <span class="text-xs font-normal leading-none text-heading">{{ $t("label.mobile_banking") }}</span>
                    </button>
                    <button data-tab="#otherpay" type="button" onclick="createkeyboard('otherpay')"
                        class="other-tabBtn w-fit flex flex-col items-center gap-2 rounded-lg py-3 px-7 border bg-[#F7F7FC] border-[#F7F7FC]"
                        :class="props.form.pos_payment_method === posPaymentMethodEnum.OTHER && !isSplitMode ? 'active' : ''"
                        @click="paymentMethod(posPaymentMethodEnum.OTHER)">
                        <i class="lab lab-other lab-font-size-24"></i>
                        <span class="text-xs font-normal leading-none text-heading">{{ $t("label.other") }}</span>
                    </button>
                    <!-- Split -->
                    <button type="button"
                        class="other-tabBtn w-fit flex flex-col items-center gap-2 rounded-lg py-3 px-7 border bg-[#F7F7FC] border-[#F7F7FC]"
                        :class="isSplitMode ? 'active' : ''"
                        @click="activateSplit">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round">
                            <path d="M16 3h5v5"/><path d="M8 3H3v5"/>
                            <path d="M12 22v-8.3a4 4 0 0 0-1.172-2.872L3 3"/>
                            <path d="m15 9 6-6"/>
                        </svg>
                        <span class="text-xs font-normal leading-none text-heading">Split</span>
                    </button>
                </nav>
            </div>

            <!-- CASH TAB -->
            <div id="cash" class="data-tab hidden"
                :class="props.form.pos_payment_method === posPaymentMethodEnum.CASH && !isSplitMode ? 'active' : ''">
                <div class="mb-4">
                    <h3 class="capitalize font-medium mb-2">{{ $t("label.received_amount") }}</h3>
                    <input id="cashInput" ref="cashInput" type="text" v-on:keypress="floatNumber($event)"
                        class="h-12 w-full rounded-lg border py-1.5 px-4 border-[#D9DBE9] text-black">
                </div>
            </div>

            <!-- CARD TAB -->
            <div id="card" class="data-tab hidden"
                :class="props.form.pos_payment_method === posPaymentMethodEnum.CARD && !isSplitMode ? 'active' : ''">
                <div class="mb-4">
                    <h3 class="capitalize font-medium mb-2">{{ $t('label.enter_card_last_4_digits') }}</h3>
                    <input id="cardInput" type="number" ref="cardInput"
                        class="h-12 w-full rounded-lg border py-1.5 px-4 border-[#D9DBE9] text-black" required>
                </div>
            </div>

            <!-- MFS TAB -->
            <div id="mfs" class="data-tab hidden"
                :class="props.form.pos_payment_method === posPaymentMethodEnum.MOBILE_BANKING && !isSplitMode ? 'active' : ''">
                <div class="mb-4">
                    <h3 class="capitalize font-medium mb-2">{{ $t('label.enter_transaction_id') }}</h3>
                    <input id="mfs-trans" type="text" ref="mfsInput"
                        class="h-12 w-full rounded-lg border py-1.5 px-4 placeholder:text-xs border-[#D9DBE9]">
                </div>
                <div class="board grid grid-cols-10 justify-between gap-1.5 mb-6"></div>
            </div>

            <!-- OTHER TAB -->
            <div id="otherpay" class="data-tab hidden"
                :class="props.form.pos_payment_method === posPaymentMethodEnum.OTHER && !isSplitMode ? 'active' : ''">
                <div class="mb-4">
                    <h3 class="capitalize font-medium mb-2">{{ $t('label.enter_payment_note') }}</h3>
                    <input id="other-trans" type="text" ref="otherInput"
                        class="h-12 w-full rounded-lg border py-1.5 px-4 placeholder:text-xs border-[#D9DBE9]">
                </div>
                <div class="board grid grid-cols-10 justify-between gap-1.5 mb-6"></div>
            </div>

            <!-- SPLIT MODE -->
            <div v-if="isSplitMode" class="mb-4">
                <input id="cashInput" ref="cashInput" type="hidden" :value="props.form.total">
                <h3 class="capitalize font-medium mb-3">{{ $t("label.received_amount") }}</h3>
                <div class="space-y-4 mb-3">
                    <div v-for="(row, idx) in splitRows" :key="idx" class="flex items-center gap-2 mt-3">
                        <select
                            v-model="row.method"
                            class="h-12 shrink-0 w-[105px] rounded-lg border border-[#D9DBE9] bg-[#F7F7FC] text-sm font-medium text-[#2E2F38] px-2 focus:outline-none focus:border-primary"
                        >
                            <option value="cash">Cash</option>
                            <option value="card">Card</option>
                        </select>
                        <input
                            :id="`splitInput_${idx}`"
                            type="text"
                            v-model="row.amountStr"
                            v-on:keypress="floatNumber($event)"
                            @focus="inputIdName = `splitInput_${idx}`"
                            @input="onSplitInput"
                            :placeholder="idx === splitRows.length - 1 ? remainingForLastRow : '0.00'"
                            :class="[
                                'h-12 w-full rounded-lg border py-1.5 px-4 text-black text-sm',
                                splitRowHasError(idx) ? 'border-red-400 bg-red-50' : 'border-[#D9DBE9]'
                            ]"
                        >
                        <button v-if="idx > 0" type="button"
                            @click="removeSplitRow(idx)"
                            class="shrink-0 h-12 w-10 flex items-center justify-center rounded-lg bg-[#F7F7FC] text-[#6E7191] hover:bg-red-50 hover:text-red-500 transition-colors">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><line x1="18" y1="6" x2="6" y2="18"/><line x1="6" y1="6" x2="18" y2="18"/></svg>
                        </button>
                    </div>
                </div>
                <div v-if="splitHasCashError" class="mb-2 flex items-start gap-1.5 text-red-600 text-xs">
                    <svg class="shrink-0 mt-0.5" xmlns="http://www.w3.org/2000/svg" width="13" height="13" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="10"/><line x1="12" y1="8" x2="12" y2="12"/><line x1="12" y1="16" x2="12.01" y2="16"/></svg>
                    Cash amount cannot be less than total. Add more rows or increase the amount.
                </div>
                <div class="flex justify-between items-center rounded-lg px-3 py-2.5 mb-3" :class="splitSummaryBg">
                    <span class="text-sm font-medium" :class="splitSummaryTextClass">{{ splitSummaryLabel }}</span>
                    <span class="font-bold text-sm" :class="splitSummaryTextClass">{{ splitSummaryValue }}</span>
                </div>
                <button type="button" @click="addSplitRow"
                    class="w-full h-10 rounded-lg border border-dashed border-[#D9DBE9] text-[#6E7191] text-sm font-medium flex items-center justify-center gap-1.5 hover:border-primary hover:text-primary transition-colors">
                    <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><line x1="12" y1="5" x2="12" y2="19"/><line x1="5" y1="12" x2="19" y2="12"/></svg>
                    Add Payment
                </button>
            </div>

            <!-- NUMPAD -->
            <div class="grid grid-cols-4 gap-x-4 gap-y-3.5 mb-6"
                v-if="props.form.pos_payment_method === posPaymentMethodEnum.CASH || props.form.pos_payment_method === posPaymentMethodEnum.CARD || isSplitMode">
                <button :onclick="`solve('1', '${inputIdName}'); window.__sp&&window.__sp(${isSplitMode})`" value="1"
                    class="num bg-[#F7F7FC] rounded-lg p-2.5 flex items-center justify-center text-base font-medium text-[#1F1F39]">1</button>
                <button :onclick="`solve('2', '${inputIdName}'); window.__sp&&window.__sp(${isSplitMode})`" value="2"
                    class="num bg-[#F7F7FC] rounded-lg p-2.5 flex items-center justify-center text-base font-medium text-[#1F1F39]">2</button>
                <button :onclick="`solve('3', '${inputIdName}'); window.__sp&&window.__sp(${isSplitMode})`" value="3"
                    class="num bg-[#F7F7FC] rounded-lg p-2.5 flex items-center justify-center text-base font-medium text-[#1F1F39]">3</button>
                <button :onclick="`Back('${inputIdName}'); window.__sp&&window.__sp(${isSplitMode})`" value="cut"
                    class="num bg-[#F7F7FC] rounded-lg p-2.5 flex items-center justify-center text-base font-medium text-[#1F1F39] row-span-2">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none">
                        <path d="M16.9997 3.75H10.2797C8.86969 3.75 7.52969 4.34 6.57969 5.39L3.04969 9.27C1.63969 10.82 1.63969 13.18 3.04969 14.73L6.57969 18.61C7.52969 19.65 8.86969 20.25 10.2797 20.25H16.9997C19.7597 20.25 21.9997 18.01 21.9997 15.25V8.75C21.9997 5.99 19.7597 3.75 16.9997 3.75ZM16.5297 13.94C16.8197 14.23 16.8197 14.71 16.5297 15C16.3797 15.15 16.1897 15.22 15.9997 15.22C15.8097 15.22 15.6197 15.15 15.4697 15L13.5297 13.06L11.5897 15C11.4397 15.15 11.2497 15.22 11.0597 15.22C10.8697 15.22 10.6797 15.15 10.5297 15C10.2397 14.71 10.2397 14.23 10.5297 13.94L12.4697 12L10.5297 10.06C10.2397 9.77 10.2397 9.29 10.5297 9C10.8197 8.71 11.2997 8.71 11.5897 9L13.5297 10.94L15.4697 9C15.7597 8.71 16.2397 8.71 16.5297 9C16.8197 9.29 16.8197 9.77 16.5297 10.06L14.5897 12L16.5297 13.94Z" fill="#1F1F39"/>
                    </svg>
                </button>
                <button :onclick="`solve('4', '${inputIdName}'); window.__sp&&window.__sp(${isSplitMode})`" value="4"
                    class="num bg-[#F7F7FC] rounded-lg p-2.5 flex items-center justify-center text-base font-medium text-[#1F1F39]">4</button>
                <button :onclick="`solve('5', '${inputIdName}'); window.__sp&&window.__sp(${isSplitMode})`" value="5"
                    class="num bg-[#F7F7FC] rounded-lg p-2.5 flex items-center justify-center text-base font-medium text-[#1F1F39]">5</button>
                <button :onclick="`solve('6', '${inputIdName}'); window.__sp&&window.__sp(${isSplitMode})`" value="6"
                    class="num bg-[#F7F7FC] rounded-lg p-2.5 flex items-center justify-center text-base font-medium text-[#1F1F39]">6</button>
                <button :onclick="`solve('7', '${inputIdName}'); window.__sp&&window.__sp(${isSplitMode})`" value="7"
                    class="num bg-[#F7F7FC] rounded-lg p-2.5 flex items-center justify-center text-base font-medium text-[#1F1F39]">7</button>
                <button :onclick="`solve('8', '${inputIdName}'); window.__sp&&window.__sp(${isSplitMode})`" value="8"
                    class="num bg-[#F7F7FC] rounded-lg p-2.5 flex items-center justify-center text-base font-medium text-[#1F1F39]">8</button>
                <button :onclick="`solve('9', '${inputIdName}'); window.__sp&&window.__sp(${isSplitMode})`" value="9"
                    class="num bg-[#F7F7FC] rounded-lg p-2.5 flex items-center justify-center text-base font-medium text-[#1F1F39]">9</button>
                <button :onclick="`Clear('${inputIdName}'); window.__sp&&window.__sp(${isSplitMode})`" value="clear" type="reset"
                    class="num bg-[#F7F7FC] rounded-lg p-2.5 flex items-center justify-center text-base font-medium text-[#1F1F39] row-span-2">
                    Clear
                </button>
                <button :onclick="`solve('00', '${inputIdName}'); window.__sp&&window.__sp(${isSplitMode})`" value="00"
                    class="num bg-[#F7F7FC] rounded-lg p-2.5 flex items-center justify-center text-base font-medium text-[#1F1F39]">00</button>
                <button :onclick="`solve('0', '${inputIdName}'); window.__sp&&window.__sp(${isSplitMode})`" value="0"
                    class="num bg-[#F7F7FC] rounded-lg p-2.5 flex items-center justify-center text-base font-medium text-[#1F1F39]">0</button>
                <button :onclick="`solve('.', '${inputIdName}'); window.__sp&&window.__sp(${isSplitMode})`" value="point"
                    class="num bg-[#F7F7FC] rounded-lg p-2.5 flex items-center justify-center text-base font-medium text-[#1F1F39]">.</button>
            </div>

            <!-- Confirm -->
            <button @click="confirmOrder" type="button"
                :disabled="isSplitMode && splitHasCashError"
                :class="[
                    'rounded-3xl text-base py-2 px-3 font-medium w-full text-white transition-opacity',
                    isSplitMode && splitHasCashError ? 'bg-primary opacity-40 cursor-not-allowed' : 'bg-primary'
                ]">
                {{ $t('button.confirm_and_print') }}
            </button>

        </div>
    </div>

    <ReceiptComponent :order="order" />
</template>

<script>
import LoadingComponent from "../components/LoadingComponent";
import appService from "../../../services/appService";
import alertService from "../../../services/alertService";
import ReceiptComponent from "./ReceiptComponent";
import posPaymentMethodEnum from "../../../enums/modules/posPaymentMethodEnum";
import sourceEnum from "../../../enums/modules/sourceEnum";
import isAdvanceOrderEnum from "../../../enums/modules/isAdvanceOrderEnum";
import orderTypeEnum from "../../../enums/modules/orderTypeEnum";

export default {
    name: "PaymentComponent",
    components: { LoadingComponent, ReceiptComponent },
    props: { props: Object, show: Boolean },
    emits: ['close'],
    data() {
        return {
            loading: { isActive: false },
            order: {},
            posPaymentMethodEnum,
            inputIdName: "cashInput",
            isSplitMode: false,
            splitRows: [],
        };
    },
    computed: {
        setting() {
            return this.$store.getters['frontendSetting/lists'];
        },
        orderTotal() {
            return parseFloat(this.$props.props.form.total) || 0;
        },
        splitTotal() {
            return this.splitRows.reduce((sum, r) => sum + (parseFloat(r.amountStr) || 0), 0);
        },
        splitRemaining() {
            return parseFloat((this.orderTotal - this.splitTotal).toFixed(10));
        },
        splitChangeDue() {
            return this.splitRemaining < 0 ? Math.abs(this.splitRemaining) : 0;
        },
        remainingForLastRow() {
            const r = this.splitRemaining;
            return r > 0 ? r.toFixed(2) : '0.00';
        },
        splitHasCashError() {
            if (this.splitRows.length === 1) {
                const r = this.splitRows[0];
                const amt = parseFloat(r.amountStr) || 0;
                return r.method === 'cash' && amt > 0 && amt < this.orderTotal;
            }
            return false;
        },
        splitRowHasError() {
            return (idx) => {
                if (this.splitRows.length !== 1) return false;
                const r = this.splitRows[idx];
                const amt = parseFloat(r.amountStr) || 0;
                return r.method === 'cash' && amt > 0 && amt < this.orderTotal;
            };
        },
        splitSummaryLabel() {
            if (this.splitChangeDue > 0) return 'Change Due';
            if (this.splitRemaining === 0) return '✓ Balanced';
            return 'Remaining';
        },
        splitSummaryValue() {
            if (this.splitChangeDue > 0) return this.currencyFormat(this.splitChangeDue, this.setting.site_digit_after_decimal_point, this.setting.site_default_currency_symbol, this.setting.site_currency_position);
            if (this.splitRemaining === 0) return '';
            return this.currencyFormat(this.splitRemaining, this.setting.site_digit_after_decimal_point, this.setting.site_default_currency_symbol, this.setting.site_currency_position);
        },
        splitSummaryBg() {
            if (this.splitChangeDue > 0 || this.splitRemaining === 0) return 'bg-green-50 border border-green-200';
            return 'bg-[#F7F7FC] border border-[#D9DBE9]';
        },
        splitSummaryTextClass() {
            if (this.splitChangeDue > 0 || this.splitRemaining === 0) return 'text-green-700';
            return 'text-[#2E2F38]';
        },
    },
    mounted() {
        window.__sp = (isInSplit) => {
            if (!isInSplit) return;
            this.$nextTick(() => {
                const id = this.inputIdName;
                const el = document.getElementById(id);
                if (!el) return;
                const match = id.match(/^splitInput_(\d+)$/);
                if (match) {
                    const idx = parseInt(match[1]);
                    if (this.splitRows[idx]) {
                        this.splitRows[idx].amountStr = el.value;
                    }
                }
            });
        };
    },
    beforeUnmount() {
        delete window.__sp;
    },
    methods: {
        currencyFormat(amount, decimal, currency, position) {
            return appService.currencyFormat(amount, decimal, currency, position);
        },
        floatNumber(e) {
            return appService.floatNumber(e);
        },
        onSplitInput() {},
        activateSplit() {
            this.isSplitMode = true;
            this.splitRows = [{ method: 'cash', amountStr: '' }];
            this.inputIdName = 'splitInput_0';
        },
        addSplitRow() {
            const idx = this.splitRows.length;
            this.splitRows.push({ method: 'card', amountStr: '' });
            this.inputIdName = `splitInput_${idx}`;
            this.$nextTick(() => {
                const el = document.getElementById(`splitInput_${idx}`);
                if (el) el.focus();
            });
        },
        removeSplitRow(idx) {
            this.splitRows.splice(idx, 1);
            const last = this.splitRows.length - 1;
            this.inputIdName = `splitInput_${last}`;
        },
        reset() {
            Object.keys(this.$refs).forEach(refName => {
                if (this.$refs[refName] && this.$refs[refName].value !== undefined) {
                    this.$refs[refName].value = "";
                }
            });
            this.$props.props.form.pos_payment_note = "";
            this.isSplitMode = false;
            this.splitRows = [];
            this.inputIdName = "cashInput";
            this.$emit('close');
        },
        paymentMethod(method, Idname = "") {
            this.isSplitMode = false;
            this.splitRows = [];
            if (Idname) this.inputIdName = Idname;
            Object.keys(this.$refs).forEach(refName => {
                if (this.$refs[refName] && this.$refs[refName].value !== undefined) {
                    this.$refs[refName].value = "";
                }
            });
            this.$props.props.form.pos_payment_method = method;
            this.$props.props.form.pos_payment_note = "";
        },
        confirmOrder() {
            if (this.isSplitMode && this.splitHasCashError) return;
            try {
                if (this.isSplitMode) {
                    this.$props.props.form.pos_payment_note = this.splitRows
                        .map(r => `${r.method === 'cash' ? 'Cash' : 'Card'}:${(parseFloat(r.amountStr) || 0).toFixed(2)}`)
                        .join('|');
                    this.$props.props.form.pos_received_amount = this.splitTotal;
                    this.$props.props.form.pos_payment_method = this.posPaymentMethodEnum.CASH;
                } else {
                    if (this.$props.props.form.pos_payment_method === this.posPaymentMethodEnum.CASH && this.$refs.cashInput.value) {
                        this.$props.props.form.pos_received_amount = this.$refs.cashInput.value;
                    } else {
                        this.$props.props.form.pos_received_amount = null;
                    }
                    if (this.$props.props.form.pos_payment_method === this.posPaymentMethodEnum.CARD && this.$refs.cardInput.value) {
                        this.$props.props.form.pos_payment_note = this.$refs.cardInput.value;
                    } else if (this.$props.props.form.pos_payment_method === this.posPaymentMethodEnum.MOBILE_BANKING && this.$refs.mfsInput.value) {
                        this.$props.props.form.pos_payment_note = this.$refs.mfsInput.value;
                    } else if (this.$props.props.form.pos_payment_method === this.posPaymentMethodEnum.OTHER && this.$refs.otherInput.value) {
                        this.$props.props.form.pos_payment_note = this.$refs.otherInput.value;
                    } else {
                        this.$props.props.form.pos_payment_note = "";
                    }
                }
                this.$store.dispatch("defaultAccess/show").then((res) => {
                    this.$props.props.form.branch_id = res.data.data.branch_id;
                    this.$store.dispatch('posOrder/save', this.$props.props.form).then(orderResponse => {
                        this.$props.props.form.token = "";
                        this.$props.props.form.subtotal = null;
                        this.$props.props.form.discount = 0;
                        this.$props.props.form.delivery_time = null;
                        this.$props.props.form.delivery_charge = null;
                        this.$props.props.form.total = 0;
                        this.$props.props.form.order_type = orderTypeEnum.DINING_TABLE;
                        this.$props.props.form.is_advance_order = isAdvanceOrderEnum.NO;
                        this.$props.props.form.source = sourceEnum.POS;
                        this.$props.props.form.address_id = null;
                        this.$props.props.form.dining_table_id = null;
                        this.$props.props.form.coupon_id = null;
                        this.$props.props.form.items = [];
                        this.$props.props.form.pos_payment_method = this.posPaymentMethodEnum.CASH;
                        this.$props.props.form.pos_payment_note = null;
                        this.$props.props.form.pos_received_amount = null;
                        this.$emit('close');
                        this.$store.dispatch('posCart/resetCart').then(res => {
                            this.loading.isActive = false;
                        }).catch();
                        this.$store.dispatch('posOrder/show', orderResponse.data.data.id).then(res => {
                            this.order = res.data.data;
                            this.loading.isActive = false;
                        }).catch((error) => {
                            this.loading.isActive = false;
                            alertService.error(error.response.data.message);
                        });
                        this.reset();
                        appService.modalShow('#receiptModal');
                    }).catch((err) => {
                        this.loading.isActive = false;
                        if (typeof err.response.data.errors === 'object') {
                            _.forEach(err.response.data.errors, (error) => {
                                alertService.error(error[0]);
                            });
                        }
                    });
                }).catch((err) => {
                    this.loading.isActive = false;
                });
            } catch (err) {
                this.loading.isActive = false;
                alertService.error(err);
            }
        },
    },
};
</script>