<template>
    <div v-if="company && order" id="receipt-content" style="width:300px; font-family: monospace; padding: 10px; background: white; color: black;">

        <!-- HEADER -->
        <div style="text-align:center; padding-bottom:10px; border-bottom: 1px dashed #999; margin-bottom:8px;">
            <h3 style="font-size:18px; font-weight:bold; margin:0 0 4px 0;">{{ company?.company_name }}</h3>
            <p style="font-size:11px; margin:2px 0;">{{ branch?.address }}</p>
            <p style="font-size:11px; margin:2px 0;">Tel: {{ branch?.phone }}</p>
        </div>

        <!-- ORDER INFO -->
        <table style="width:100%; margin: 6px 0;">
            <tbody>
                <tr>
                    <td style="font-size:11px; text-align:left;">Order #{{ order?.order_serial_no }}</td>
                </tr>
                <tr>
                    <td style="font-size:11px; text-align:left;">{{ order?.order_date }}</td>
                    <td style="font-size:11px; text-align:right;">{{ order?.order_time }}</td>
                </tr>
            </tbody>
        </table>

        <!-- ITEMS -->
        <table style="width:100%; border-collapse:collapse;">
            <thead>
                <tr style="border-top:1px dashed #999; border-bottom:1px dashed #999;">
                    <th style="font-size:11px; font-weight:normal; text-align:left; padding:4px 0; width:30px;">
                        {{ $t('label.qty') }}
                    </th>
                    <th style="font-size:11px; font-weight:normal; text-align:left; padding:4px 0;">
                        {{ $t('label.item_description') }}
                    </th>
                    <th style="font-size:11px; font-weight:normal; text-align:right; padding:4px 0;">
                        {{ $t('label.price') }}
                    </th>
                </tr>
            </thead>
            <tbody style="border-bottom:1px dashed #999;">
                <tr v-for="item in orderItems" :key="item">
                    <td style="font-size:11px; text-align:left; vertical-align:top; padding:3px 0;">
                        {{ item.quantity }}
                    </td>
                    <td style="font-size:11px; text-align:left; vertical-align:top; padding:3px 0;">
                        <div>{{ item.item_name }}</div>
                        <div v-if="Object.keys(item.item_variations).length !== 0" style="font-size:10px; color:#555;">
                            <span v-for="(variation, index) in item.item_variations">
                                {{ variation.variation_name }}: {{ variation.name }}<span v-if="index + 1 < Object.keys(item.item_variations).length">, </span>
                            </span>
                        </div>
                        <div v-if="item.item_extras.length > 0" style="font-size:10px; color:#555;">
                            Extras: <span v-for="(extra, index) in item.item_extras">{{ extra.name }}<span v-if="index + 1 < item.item_extras.length">, </span></span>
                        </div>
                        <div v-if="item.instruction" style="font-size:10px; color:#555;">
                            Note: {{ item.instruction }}
                        </div>
                        <div v-if="item.tax_rate > 0" style="font-size:10px; color:#555; display:flex; justify-content:space-between;">
                            <span>{{ item.tax_name }} ({{ item.tax_currency_rate }} {{ item.tax_type }})</span>
                            <span>{{ item.tax_currency_amount }}</span>
                        </div>
                    </td>
                    <td style="font-size:11px; text-align:right; vertical-align:top; padding:3px 0;">
                        {{ item.total_without_tax_currency_price }}
                    </td>
                </tr>
            </tbody>
        </table>

        <!-- TOTALS -->
        <table style="width:100%; margin-top:6px;">
            <tbody>
                <tr>
                    <td style="font-size:11px; text-align:left; padding:2px 0; text-transform:uppercase;">{{ $t('label.subtotal') }}:</td>
                    <td style="font-size:11px; text-align:right; padding:2px 0;">{{ order?.subtotal_without_tax_currency_price }}</td>
                </tr>
                <tr>
                    <td style="font-size:11px; text-align:left; padding:2px 0; text-transform:uppercase;">{{ $t('label.total_tax') }}:</td>
                    <td style="font-size:11px; text-align:right; padding:2px 0;">{{ order?.total_tax_currency_price }}</td>
                </tr>
                <tr>
                    <td style="font-size:11px; text-align:left; padding:2px 0; text-transform:uppercase;">{{ $t('label.discount') }}:</td>
                    <td style="font-size:11px; text-align:right; padding:2px 0;">{{ order?.discount_currency_price }}</td>
                </tr>
                <tr v-if="order?.order_type === orderTypeEnum.DELIVERY">
                    <td style="font-size:11px; text-align:left; padding:2px 0; text-transform:uppercase;">{{ $t('label.delivery_charge') }}:</td>
                    <td style="font-size:11px; text-align:right; padding:2px 0;">{{ order?.delivery_charge_currency_price }}</td>
                </tr>
                <tr style="border-top:1px solid #999;">
                    <td style="font-size:12px; font-weight:bold; text-align:left; padding:3px 0; text-transform:uppercase;">{{ $t('label.total') }}:</td>
                    <td style="font-size:12px; font-weight:bold; text-align:right; padding:3px 0;">{{ order?.total_currency_price }}</td>
                </tr>
            </tbody>
        </table>

        <!-- PAYMENT INFO -->
        <div style="border-top:1px dashed #999; border-bottom:1px dashed #999; padding:6px 0; margin:6px 0; font-size:11px;">
            <div>{{ $t('label.order_type') }}: {{ enums.orderTypeEnumArray[order?.order_type] }}</div>
            <div style="display:flex; justify-content:space-between;">
                <span>{{ $t('label.payment_type') }}: {{ posPaymentMethodEnumArray[order?.pos_payment_method] }}</span>
                <span v-if="order?.cash_back_amount > 0">
                    <div>{{ $t('label.cash') }}: {{ order?.pos_received_currency_amount }}</div>
                    <div>{{ $t('label.change') }}: {{ order?.cash_back_currency_amount }}</div>
                </span>
            </div>
        </div>

        <!-- TOKEN -->
        <div v-if="order?.token" style="text-align:center; font-size:18px; font-weight:bold; padding:6px 0; border-bottom:1px dashed #999;">
            {{ $t('label.token') }} #{{ order?.token }}
        </div>

        <!-- FOOTER -->
        <div style="text-align:center; padding-top:8px; padding-bottom:4px;">
            <p style="font-size:11px; margin:2px 0;">{{ $t('message.thank_you') }}</p>
            <p style="font-size:11px; margin:2px 0;">{{ $t('message.please_come_again') }}</p>
        </div>
        <div style="text-align:right; margin-top:4px;">
            <p style="font-size:9px; margin:0;">{{ $t('label.powered_by') }}</p>
            <p style="font-size:11px; margin:0; font-weight:bold;">{{ company?.company_name }}</p>
        </div>

    </div>
</template>

<script>
import displayModeEnum from "../../../enums/modules/displayModeEnum";
import posPaymentMethodEnum from "../../../enums/modules/posPaymentMethodEnum";
import OrderTypeEnum from "../../../enums/modules/orderTypeEnum";

export default {
    name: "PosOrderReceiptListComponent",
    props: {
        order: {
            type: Object,
            default: () => ({})
        }
    },
    data() {
        return {
            posPaymentMethodEnumArray: {
                [posPaymentMethodEnum.CASH]: this.$t("label.cash"),
                [posPaymentMethodEnum.CARD]: this.$t("label.card"),
                [posPaymentMethodEnum.MOBILE_BANKING]: this.$t("label.mobile_banking"),
                [posPaymentMethodEnum.OTHER]: this.$t("label.other"),
            },
            orderTypeEnum: OrderTypeEnum,
            enums: {
                orderTypeEnumArray: {
                    [OrderTypeEnum.DELIVERY]: this.$t("label.delivery"),
                    [OrderTypeEnum.TAKEAWAY]: this.$t("label.takeaway"),
                    [OrderTypeEnum.DINING_TABLE]: this.$t("label.dining_table")
                }
            }
        }
    },
    computed: {
        company: function () {
            return this.$store.getters['company/lists'];
        },
        branch: function () {
            return this.$store.getters['backendGlobalState/branchShow'];
        },
        orderItems: function () {
            return this.$store.getters['posOrder/orderItems'];
        },
        direction: function () {
            return this.$store.getters['frontendLanguage/show'].display_mode === displayModeEnum.RTL ? 'rtl' : 'ltr';
        },
    },
    mounted() {
        this.$store.dispatch("company/lists").then().catch();
    }
}
</script>