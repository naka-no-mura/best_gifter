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
        <div class="select is-medium top-call-min">
          <select v-model="min_price_selected.value" @input="changeMinPrice($event.target.value)" id="search-min">
            <option disabled>いくらから</option>
            <option v-for="price in min_prices" :key="price.id" :value="price.price">
              {{ price.value }}
            </option>
          </select>
        </div>
      </p>
      <p class="control">
        <div class="select is-medium top-call-max">
          <select v-model="max_price_selected.value" @input="changeMaxPrice($event.target.value)" id="search-max">
            <option disabled>いくらまで</option>
            <option v-for="price in max_prices" :key="price.id" :value="price.price">
              {{ price.value }}
            </option>
          </select>
        </div>
      </p>
      <p class="control">
        <b-button
          class="search-btn"
          type="submit is-medium"
          @keyup.enter="
            keywordSearch();
            search();
          "
          @click="
            keywordSearch();
            search();
          "
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
  data() {
    return {
      min_prices: [
        { value: "設定しない", price: "" },
        { value: "1,000円〜", price: 1000 },
        { value: "3,000円〜", price: 3000 },
        { value: "5,000円〜", price: 5000 },
        { value: "10,000円〜", price: 10000 },
        { value: "15,000円〜", price: 15000 },
        { value: "20,000円〜", price: 20000 },
        { value: "30,000円〜", price: 30000 },
        { value: "50,000円〜", price: 50000 },
        { value: "100,000円〜", price: 100000 },
      ],
      min_price_selected: { price: 1000, value: "いくらから" },
      max_prices: [
        { value: "設定しない", price: "" },
        { value: "〜1,000円", price: 1000 },
        { value: "〜3,000円", price: 3000 },
        { value: "〜5,000円", price: 5000 },
        { value: "〜10,000円", price: 10000 },
        { value: "〜15,000円", price: 15000 },
        { value: "〜20,000円", price: 20000 },
        { value: "〜30,000円", price: 30000 },
        { value: "〜50,000円", price: 50000 },
        { value: "〜100,000円", price: 100000 },
      ],
      max_price_selected: { price: 1000, value: "いくらまで" },
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
}
.top-call-keyword {
  width: 30rem;
}
.search-btn {
  background-color: #ffd3d4;
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
