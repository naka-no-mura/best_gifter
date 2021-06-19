<template>
  <div>
    <!-- pcバージョン -->
    <div class="block api-call pc-call">
      <div class="field has-addons">
        <p class="control">
          <input
            id="search-item"
            class="input call-keyword is-medium"
            type="search"
            placeholder="キーワード"
            @input="changeKeyword($event.target.value)"
          >
        </p>
        <p class="control">
        <div class="select is-medium">
          <select v-model="min_price_selected.value" @input="changeMinPrice($event.target.value)" name="search-min">
            <option disabled>いくらから</option>
            <option v-for="price in min_prices" :key="price.id" :value="price.price">
              {{ price.value }}
            </option>
          </select>
        </div>
        </p>
        <p class="control">
        <div class="select is-medium">
          <select v-model="max_price_selected.value" @input="changeMaxPrice($event.target.value)" name="search-max">
            <option disabled>いくらまで</option>
            <option v-for="price in max_prices" :key="price.id" :value="price.price">
              {{ price.value }}
            </option>
          </select>
        </div>
        </p>
        <p class="control">
          <b-button
            id="serch-btn"
            class="is-medium search-btn"
            @keyup.enter="setPage(1); pageToTop();"
            @click="setPage(1); pageToTop()"
          >
            <b-icon
              icon="magnify"
              size="is-medium"
            />
          </b-button>
        </p>
      </div>
    </div>
    <!-- スマホバージョン -->
    <div class="block api-call responsive-call">
      <div class="field has-addons">
        <p class="control">
          <input
            class="input call-keyword is-small"
            type="search"
            placeholder="キーワード"
            @input="changeKeyword($event.target.value)"
          >
        </p>
        <p class="control">
        <div class="select is-small">
          <select v-model="min_price_selected.value" @change="changeMinPrice($event.target.value)" id="search-min">
            <option disabled>いくらから</option>
            <option v-for="price in min_prices" :key="price.id" :value="price.price">
              {{ price.value }}
            </option>
          </select>
        </div>
        </p>
        <p class="control">
        <div class="select is-small">
          <select v-model="max_price_selected.value" @change="changeMaxPrice($event.target.value)" id="search-max">
            <option disabled>いくらまで</option>
            <option v-for="price in max_prices" :key="price.id" :value="price.price">
              {{ price.value }}
            </option>
          </select>
        </div>
        </p>
        <p class="control">
          <b-button
            class="is-small search-btn"
            @keyup.enter="setPage(1); pageToTop();"
            @click="setPage(1); pageToTop();"
          >
            <b-icon
              icon="magnify"
              size="is-small"
            />
          </b-button>
        </p>
      </div>
    </div>
  </div>
</template>
<script>
import { mapActions, mapGetters } from "vuex";
import {
  changeKeyword,
  changeGenreId,
  changeMinPrice,
  changeMaxPrice,
  changeSort,
  changePage,
  search,
} from "../../../store/mutation-types";
export default {
  name: "RakutenApiCall",
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
  computed: {
    ...mapGetters("rakuten_api", ["count"]),
  },
  created() {
    this.search();
  },
  methods: {
    ...mapActions("rakuten_api", [
      "changeKeyword",
      "changeMinPrice",
      "changeMaxPrice",
      "changeSort",
      "changePage",
      "search",
    ]),
    //再検索とソート変更の時は毎回1ページ目を表示させる
    setPage(page) {
      var vm = this;
      vm.search(vm.changePage(page));
    },
    pageToTop() {
      window.scrollTo({
        top: 0,
        behavior: "auto",
      });
    },
  },
};
</script>
<style scoped>
.api-call {
  margin: 3rem 1rem 0;
  padding-top: 3rem;
}
.flash-message {
  color: red;
  margin: 0.5rem;
}
.sort-btn {
  margin-right: 1rem;
}
.responsive-call {
  display: none;
}
.search-btn {
  background-color: #ffd3d4;
}
@media screen and (max-width: 959px) {
  .pc-call {
    display: block;
    width: 100%;
    margin: 0 auto;
    padding: 3.5rem 0.5rem 0;
    position: fixed;
    z-index: 29;
    background-color: #f0eee9;
  }
}
@media screen and (max-width: 480px) {
  .pc-call {
    display: none;
  }
  .responsive-call {
    display: block;
    width: 100%;
    margin: 0 auto;
    padding: 1rem 0.5rem 0;
    position: fixed;
    z-index: 29;
    background-color: #f0eee9;
  }
}
</style>
