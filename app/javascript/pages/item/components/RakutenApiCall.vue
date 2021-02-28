<template>
  <!-- 検索フォーム ここから -->
  <div class="section">
    <nav class="level">
      <div class="level-left">
        <div class="level-item">
          <div class="field has-addons">
            <p class="control">
              <input
                class="input call-keyword is-medium"
                type="search"
                v-model="keywordBox"
                placeholder="キーワード"
                @input="changeKeyword($event.target.value)"
              />
            </p>
            <p class="control">
              <input
                class="input call-min is-medium"
                type="number"
                min="0"
                v-model="minPriceBox"
                placeholder="いくらから"
                @input="changeMinPrice($event.target.value)"
              />
            </p>
            <p class="control">
              <input
                class="input call-max is-medium"
                type="number"
                min="0"
                v-model="maxPriceBox"
                placeholder="いくらまで"
                @input="changeMaxPrice($event.target.value)"
              />
            </p>
            <p class="control">
              <b-button class="is-medium" @click="setPage(1)"
                ><b-icon icon="magnify" size="is-medium"></b-icon
              ></b-button>
            </p>
            <p>
              <b-button @click="formClear()" class="is-medium" type="is-text">
                クリア
              </b-button>
            </p>
          </div>
        </div>
      </div>
    </nav>
    <!-- 並び替え ここから -->
    <nav class="level">
      <div class="level-right"></div>
      <div class="level-right">
        <div class="level-item">
          <span>並び替え　</span>
          <select
            class="select"
            v-model="sort_selected.sort"
            v-if="count"
            @change="
              changeSort($event.target.value);
              setPage(1);
            "
          >
            <option v-for="sort in sorts" :value="sort.sort" :key="sort.id">
              {{ sort.name }}
            </option>
          </select>
        </div>
      </div>
    </nav>
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
  props: {
    items: Array,
    required: true,
  },
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
.flash-message {
  color: red;
  margin: 0.5rem;
}
.search-btn {
  /* margin: 0.5rem;
  width: 15rem; */
  background-color: #ffd3d4;
  border: 5px solid #ffd3d4;
  transition: 0.3s;
}
.search-btn:hover {
  background-color: white;
  border: 5px solid #ffd3d4;
}
</style>
