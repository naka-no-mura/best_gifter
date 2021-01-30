<template>
  <article
    class="message is-danger"
    v-if="error"
    aria-close-label="Close message"
  >
    <div class="message-body">
      {{ errorMessage(error) }}
      <div>
        <b-button
          type="is-text"
          @click="
            reset();
            serach();
          "
          >検索条件をリセットする</b-button
        >
      </div>
    </div>
  </article>
</template>

<script>
import { mapGetters } from "vuex";

export default {
  name: "RakutenApiError",
  computed: {
    ...mapGetters(["error"]),
  },
  methods: {
    reset() {
      this.$router.go({ path: this.$router.currentRoute.path, force: true });
    },
    errorMessage(error) {
      if (error.indexOf("keyword is not valid") !== -1) {
        return "ひらがな・カタカナ・記号の場合は2文字以上で検索してください。";
      } else if (error.indexOf("keyword parameter is not valid") !== -1) {
        return "ひらがな・カタカナ・記号の場合は2文字以上で検索してください。";
      } else if (error.indexOf("minPrice must be under maxPrice") !== -1) {
        return "価格下限は、価格上限より小さい値で検索してください。";
      } else if (error.indexOf("maxPrice must be a number") !== -1) {
        return "価格条件は半角数字で入力してください。";
      } else if (error.indexOf("minPrice must be a number") !== -1) {
        return "価格条件は半角数字で入力してください。";
      } else if (error.indexOf("maxPrice must be over 0") !== -1) {
        return "価格条件は0以上の数字で入力してください。";
      } else if (error.indexOf("minPrice must be over 0") !== -1) {
        return "価格条件は0以上の数字で入力してください。";
      } else if (
        error.indexOf(
          "number of allowed requests has been exceeded for this API. please try again soon."
        ) !== -1
      ) {
        return "アクセスが集中しております。しばらく時間を空けてからご利用ください。";
      } else if (error.indexOf("not found") !== -1) {
        return "対象の商品が見つかりませんでした。別の条件で検索してください。";
      } else if (error.indexOf("api logic error") !== -1) {
        return "システムエラー。長時間続くようであれば、運営へごお問い合わせください。";
      } else {
        return "システムエラーが発生しております。大変申し訳ございませんが、運営へご連絡いただきますよう宜しくお願いいたします。";
      }
    },
  },
};
</script>

<style scoped></style>
