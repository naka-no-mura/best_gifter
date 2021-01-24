<template>
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
        <router-link to="/items">
        <input
          class="submit button"
          type="submit"
          value="検索"
          @click="
            search();
          "
        />
        </router-link>
      </b-field>
  </div>
</template>
<script>
import { mapActions } from "vuex";
import {
  changeKeyword,
  changeGenreId,
  changeMinPrice,
  changeMaxPrice,
  search,
} from "../../../store/mutation-types";
export default {
  name: "RakutenApiCallTopVer",
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
    };
  },

  methods: {
    ...mapActions([
      "changeKeyword",
      "changeGenreId",
      "changeMinPrice",
      "changeMaxPrice",
      "search",
    ]),
  },
};
</script>
<style scoped>
.select_box {
  width: 10rem;
}
</style>
