<template>
  <div v-if="count">
    <div>{{ first }}〜{{ last }}件（{{ count }}件）</div>
    <div class="block">
    <b-taglist>
      <b-tag type="is-warning" v-if="keyword">{{ keyword }}</b-tag>
      <b-tag type="is-warning" v-if="genreId">{{ genreId }}</b-tag>
      <b-tag type="is-warning" v-if="minPrice">{{ minPrice }}円〜</b-tag>
      <b-tag type="is-warning" v-if="maxPrice">〜{{ maxPrice }}円</b-tag>
      の検索結果
    </b-taglist>
    </div>
  </div>
</template>

<script>
import { mapGetters } from "vuex";

export default {
  name: "RakutenApiResultHit",
  data() {
    return {};
  },
  computed: {
    ...mapGetters([
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
};
</script>

<style scoped></style>
