<template>
  <div>
    <!-- pcバージョン -->
    <div class="block api-call pc-call">
      <div class="field has-addons">
        <p class="control">
          <input
            id="search-item"
            v-model="keywordBox"
            class="input call-keyword is-medium"
            type="search"
            placeholder="キーワード"
            @input="changeKeyword($event.target.value)"
          >
        </p>
        <p class="control">
          <input
            id="search-min"
            v-model="minPriceBox"
            class="input call-min is-medium"
            type="number"
            min="0"
            placeholder="いくらから"
            @input="changeMinPrice($event.target.value)"
          >
        </p>
        <p class="control">
          <input
            id="search-max"
            v-model="maxPriceBox"
            class="input call-max is-medium"
            type="number"
            min="0"
            placeholder="いくらまで"
            @input="changeMaxPrice($event.target.value)"
          >
        </p>
        <p class="control">
          <b-button
            id="serch-btn"
            class="is-medium"
            @keyup.enter="setPage(1)"
            @click="setPage(1)"
          >
            <b-icon
              icon="magnify"
              size="is-medium"
            />
          </b-button>
        </p>
        <p>
          <b-button
            class="is-medium"
            type="is-text"
            @click="formClear()"
          >
            クリア
          </b-button>
        </p>
      </div>
    </div>
    <!-- スマホバージョン -->
    <div class="block api-call responsive-call">
      <div class="field has-addons">
        <p class="control">
          <input
            v-model="keywordBox"
            class="input call-keyword is-small"
            type="search"
            placeholder="キーワード"
            @input="changeKeyword($event.target.value)"
          >
        </p>
        <p class="control">
          <input
            v-model="minPriceBox"
            class="input call-min is-small"
            type="number"
            min="0"
            placeholder="いくらから"
            @input="changeMinPrice($event.target.value)"
          >
        </p>
        <p class="control">
          <input
            v-model="maxPriceBox"
            class="input call-max is-small"
            type="number"
            min="0"
            placeholder="いくらまで"
            @input="changeMaxPrice($event.target.value)"
          >
        </p>
        <p class="control">
          <b-button
            class="is-small"
            @keyup.enter="setPage(1)"
            @click="setPage(1)"
          >
            <b-icon
              icon="magnify"
              size="is-small"
            />
          </b-button>
        </p>
        <!-- <p>
          <b-button @click="formClear()" class="is-medium" type="is-text">
            クリア
          </b-button>
        </p> -->
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
      keywordBox: "",
      minPriceBox: "",
      maxPriceBox: "",
      // フォーム部分(プルダウン)の並び替え用
      sorts: [
        { sort: "standard", name: "標準" },
        { sort: "-reviewCount", name: "レビュー件数順" },
        { sort: "-reviewAverage", name: "レビュー評価順" },
        { sort: "-itemPrice", name: "価格が高い順" },
        { sort: "+itemPrice", name: "価格が安い順" },
        { sort: "+updateTimestamp", name: "新着順" },
      ],
      sort_selected: { sort: "standard", name: "標準" },
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
    formClear() {
      this.keywordBox = "";
      this.minPriceBox = "";
      this.maxPriceBox = "";
    },
  },
};
</script>
<style scoped>
.api-call {
  margin: 5rem 1rem 0;
  padding-top: 5rem;
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
@media screen and (max-width: 959px) {
  .pc-call {
    display: block;
    width: 100%;
    margin: 0 auto;
    padding: 5rem 0.5rem 0;
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
    padding: 2rem 0.5rem 0;
    position: fixed;
    z-index: 29;
    background-color: #f0eee9;
  }
}
</style>
