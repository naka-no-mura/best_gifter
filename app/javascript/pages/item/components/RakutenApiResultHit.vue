<template>
  <div v-if="count">
    <div>
      {{ first.toLocaleString() }}〜{{ last.toLocaleString() }}件（{{
        count.toLocaleString()
      }}件）
    </div>
    <div class="block">
      <b-taglist>
        検索条件：
        <b-tag class="tag" rounded v-if="keyword">{{ keyword }}</b-tag>
        <b-tag class="tag" rounded v-if="genreId">{{
          genreIdToName(genreId)
        }}</b-tag>
        <b-tag class="tag" rounded v-if="minPrice"
          >{{ minPrice.toLocaleString() }}円〜</b-tag
        >
        <b-tag class="tag" rounded v-if="maxPrice"
          >〜{{ maxPrice.toLocaleString() }}円</b-tag
        >
        <b-tag
        class="tag"
          rounded
          v-if="!(keyword || maxPrice || minPrice || maxPrice || genreId)"
          >結婚（デフォルト検索）</b-tag
        >
        <b-button
         class="tag button"
          v-if="keyword || maxPrice || minPrice || maxPrice || genreId"
          @click="resetSearch()"
          >検索条件の解除</b-button
        >
      </b-taglist>
    </div>
  </div>
</template>

<script>
import { mapGetters, mapActions } from "vuex";

export default {
  name: "RakutenApiResultHit",
  computed: {
    ...mapGetters("rakuten_api", [
      "keyword",
      "genreId",
      "count",
      "first",
      "last",
      "page",
      "minPrice",
      "maxPrice",
    ]),
  },
  methods: {
    ...mapActions("rakuten_api", ["resetSearch"]),
    genreIdToName(genreId) {
      if (genreId === 100433) {
        return "ルームウェア";
      } else if (genreId === 562637) {
        return "家電";
      } else if (genreId === 510915) {
        return "洋酒";
      } else if (genreId === 100804) {
        return "インテリア";
      } else if (genreId === 215783) {
        return "日用品雑貨";
      } else if (genreId === 100005) {
        return "花";
      } else if (genreId === 566732) {
        return "カタログ";
      } else if (genreId === 553283) {
        return "ギフト券・商品券";
      } else if (genreId === 558944) {
        return "キッチン用品・食器";
      }
    },
  },
};
</script>

<style scoped>
.tag {
  background-color: #ffd3d4;
  border: none;
}
.button {
  background-color: #ffd3d4;
  border: none;
}
.button:hover {
  opacity: 0.5;
}
</style>
