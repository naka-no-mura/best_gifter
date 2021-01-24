<template>
  <div v-if="count">
  <div>{{ first }}〜{{ last }}件（{{ count }}件）</div>
  <div>「{{ keyword }} {{ genreId }}」の検索結果</div>
  </div>
</template>

<script>
import { mapGetters } from "vuex";

export default {
  name: "RakutenApiResultHit",
  data() {
    return {
    }
  },
  computed: {
    ...mapGetters(["keyword", "genreId", "count", "first", "last", "page"]),
  },
};
</script>

<style scoped></style>
