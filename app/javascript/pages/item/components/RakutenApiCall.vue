<template>
    <!-- 検索フォーム ここから -->
    <div>
      <b-field>
        <input
          class="text"
          type="text"
          placeholder="キーワードを入力する"
          @change="changeKeyword($event.target.value)"
        />
        <select
          class="select_box"
          v-model="genreId_selected"
          @change="changeGenreId($event.target.value)"
        >
          <option disabled value="">ジャンルで選ぶ</option>
          <option
            v-for="genreId in genreIds"
            :value="genreId.genreId"
            :key="genreId.id"
          >
            {{ genreId.name }}
          </option>
        </select>
        <input
          class="text"
          type="text"
          placeholder="最小価格を入力する"
          @change="changeMinPrice($event.target.value)"
        />
        <input
          class="text"
          type="text"
          placeholder="最大価格を入力する"
          @change="changeMaxPrice($event.target.value)"
        />
        <input
          class="submit button"
          type="submit"
          value="検索"
          @click="
            setPage(1);
            show = !show;
          "
        />
      </b-field>
    <!-- 並び替え ここから -->
      <b-field>
        <select
          class="select_box"
          v-model="sort_selected.sort"
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
import { mapActions } from "vuex";
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
      show: true,
      relationship_genre_show: true,
      // フォーム部分(プルダウン)のジャンル検索用
      genreIds: [
        { genreId: 100433, name: "ルームウェア" },
        { genreId: 562637, name: "家電" },
        { genreId: 510915, name: "洋酒" },
        { genreId: 100804, name: "インテリア" },
        { genreId: 215783, name: "日用品雑貨" },
        { genreId: 558944, name: "キッチン用品・食器" },
        { genreId: 100005, name: "花" },
        { genreId: 566732, name: "カタログ" },
        { genreId: 553283, name: "ギフト券・商品券" },
      ],
      genreId_selected: "",
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

  methods: {
    ...mapActions([
      "changeKeyword",
      "changeGenreId",
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
  },
};
</script>
<style scoped>
.select_box {
  width: 10rem;
}
</style>
