<template>
  <div class="section">
    <div class="field has-addons">
      <p class="control">
        <input
          class="input top-call-keyword is-medium"
          type="search"
          placeholder="キーワード(例:結婚)"
          @input="changeKeyword($event.target.value)"
        >
      </p>
      <p class="control">
        <input
          class="input top-call-min is-medium"
          type="number"
          min="0"
          placeholder="任意：いくらから"
          @input="changeMinPrice($event.target.value)"
        >
      </p>
      <p class="control">
        <input
          class="input top-call-max is-medium"
          type="number"
          min="0"
          placeholder="任意：いくらまで"
          @input="changeMaxPrice($event.target.value)"
        >
      </p>
      <p class="control">
        <b-button
          type="submit is-medium"
          @keyup.enter="
            keywordSearch();
            search();
          "
          @click="
            keywordSearch();
            search();"
        >
          <b-icon
            icon="magnify"
            size="is-medium"
          />
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
@media screen and (max-width: 959px) {
  .top-call-keyword {
    width: auto;
  }
}
@media screen and (max-width: 480px) {
  .top-call-keyword {
    width: 100%;
  }
  .section {
    display: flex;
    justify-content: center;
    margin-top: 0rem;
    padding: 1rem 0.5rem;
  }
  .top-call-min {
    display: none;
  }
  .top-call-max {
    display: none;
  }
}
</style>
