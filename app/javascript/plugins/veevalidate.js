import Vue from "vue";
import { ValidationProvider, ValidationObserver, extend } from "vee-validate";
import { email, required } from "vee-validate/dist/rules";

Vue.component("ValidationObserver", ValidationObserver);
Vue.component("ValidationProvider", ValidationProvider);

extend("requiredKeyword", {
  ...required,
  message: "キーワード検索の場合、キーワードは必須項目です",
});

extend("min", {
  validate(value) {
    return value >= 0;
  },
  message: "{_field_}は0以上の数値で入力してください",
});

extend("minKeyword", {
  validate(value) {
    return value >= 1;
  },
  message: "{_field_}は1文字以上で入力してください",
});

extend("required", {
  ...required,
  message: "必須項目です",
});
