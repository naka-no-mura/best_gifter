<template>
  <!-- 検索フォーム ここから -->
  <div class="section">
    <ValidationProvider rules="minKeyword:1" v-slot="{ errors }">
      <b-field class="b-field">
        <span>キーワードで絞る　：</span>
        <div>
          <input
            class="input"
            type="text"
            v-model="keywordBox"
            name="キーワード"
            placeholder="複数入力可能（任意）"
            @input="changeKeyword($event.target.value)"
          />
        </div>
        <span class="flash-message">{{ errors[0] }}</span>
      </b-field>
    </ValidationProvider>
    <ValidationProvider rules="min:0" v-slot="{ errors }">
      <b-field class="b-field">
        <span>価格下限を設定する：</span>
        <div>
          <input
            class="input"
            type="number"
            v-model="minPriceBox"
            name="価格下限"
            placeholder="0以上の数値（任意）"
            @input="changeMinPrice($event.target.value)"
          />
        </div>
        <span class="flash-message">{{ errors[0] }}</span>
      </b-field>
    </ValidationProvider>
    <ValidationProvider rules="min:0" v-slot="{ errors }">
      <b-field class="b-field">
        <span>価格上限を設定する：</span>
        <div>
          <input
            class="input"
            type="number"
            v-model="maxPriceBox"
            name="価格上限"
            placeholder="0以上の数値（任意）"
            @input="changeMaxPrice($event.target.value)"
          />
        </div>
        <span class="flash-message">{{ errors[0] }}</span>
      </b-field>
    </ValidationProvider>
    <b-field>
      <div>
        <button class="button is-warning" @click="setPage(1)">検索</button>
      </div>
      <!-- フォーム内クリア -->
      <button @click="formClear()" class="button is-warning is-light">
        クリア
      </button>
    </b-field>
    <!-- 並び替え ここから -->
    <b-field>
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
    </b-field>
    <!-- 検索フォーム ここまで -->
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
.b-field {
  margin: 0.5rem;
}
.flash-message {
  color: red;
  margin: 0.5rem;
}
.button {
  margin: 0.5rem;
  width: 15rem;
}
</style>
