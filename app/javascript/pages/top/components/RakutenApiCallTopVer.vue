<template>
  <div class="section">
    <div class="field has-addons">
      <p class="control">
        <input
          class="input top-call-keyword is-medium"
          type="search"
          placeholder="必須：キーワード（例：結婚）"
          @input="changeKeyword($event.target.value)"
        />
      </p>
      <p class="control">
        <input
          class="input top-call-min is-medium"
          type="number"
          min="0"
          placeholder="任意：いくらから"
          @input="changeMinPrice($event.target.value)"
        />
      </p>
      <p class="control">
        <input
          class="input top-call-max is-medium"
          type="number"
          min="0"
          placeholder="任意：いくらまで"
          @input="changeMaxPrice($event.target.value)"
        />
      </p>
      <p class="control">
        <b-button
          type="submit is-medium"
          @click="
            keywordSearch();
            search();
          "
          :disabled="invalid"
        >
          <b-icon icon="magnify" size="is-medium"></b-icon>
        </b-button>
      </p>
    </div>
  </div>
</template>
<script>
import { mapActions } from "vuex";
import {
  changeKeyword,
  changeMinPrice,
  changeMaxPrice,
  search,
} from "../../../store/mutation-types";
export default {
  name: "RakutenApiCallTopVer",
  data() {
    return {
      keywordBox: "",
      minPriceBox: "",
      maxPriceBox: "",
    };
  },
  methods: {
    ...mapActions("rakuten_api", [
      "changeKeyword",
      "changeMinPrice",
      "changeMaxPrice",
      "search",
    ]),
    keywordSearch() {
      this.$router.push("/items");
    },
  },
};
</script>
<style scoped>
.section {
  display: flex;
  justify-content: center;
  margin-top: 5rem;
}
.top-call-keyword {
  width: 30rem;
}
</style>
