<template>
  <div v-if="count">
    <div>{{ first.toLocaleString() }}〜{{ last.toLocaleString() }}件（{{ count.toLocaleString() }}件）</div>
    <div class="block">
      <b-taglist>
        <b-tag type="is-warning" rounded v-if="keyword">{{ keyword }}</b-tag>
        <b-tag type="is-warning" rounded v-if="genreId">{{ genreId }}</b-tag>
        <b-tag type="is-warning" rounded v-if="minPrice"
          >{{ minPrice.toLocaleString() }}円〜</b-tag
        >
        <b-tag type="is-warning" rounded v-if="maxPrice"
          >〜{{ maxPrice.toLocaleString() }}円</b-tag
        >
        <b-tag
          type="is-warning"
          rounded
          v-if="!(keyword || maxPrice || minPrice || maxPrice || genreId)"
          >結婚</b-tag
        >
        の検索結果
        <b-button
          type="is-text"
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
  methods: {
    ...mapActions(["resetSearch"]),
  },
};
</script>

<style scoped></style>
