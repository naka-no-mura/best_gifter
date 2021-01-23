<template>
  <div>
  <div>{{ first }}〜{{ last }}件（{{ count }}件）</div>
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
    ...mapGetters(["count", "first", "last", "page"]),
  },
};
</script>

<style scoped></style>
