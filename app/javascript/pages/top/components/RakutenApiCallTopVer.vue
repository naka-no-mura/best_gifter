<template>
  <div class="section">
        <b-field class="b-field">
            <b-input
              type="search"
              style="width: 30rem;"
              size="is-large"
              placeholder="必須：キーワード（例：結婚）"
              @input="changeKeyword($event.target.value)"
            /></b-input>
            <b-input
              class="control"
              type="number"
              min="0"
              size="is-large"
              placeholder="任意：いくらから"
              @input="changeMinPrice($event.target.value)"
            /></b-input>
            <b-input
              class="control"
              type="number"
              min="0"
              size="is-large"
              placeholder="任意：いくらまで"
              @input="changeMaxPrice($event.target.value)"
            /></b-input>
        <p class="control">
          <b-button
            class="button"
            type="submit is-large"
            @click="
              keywordSearch();
              search();
            "
            :disabled="invalid"
          >
            <b-icon icon="magnify" size="is-medium"></b-icon>
          </b-button>
        </p>
      </b-field>
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
.b-field {
}
</style>
