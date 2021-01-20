<template>
  <div>{{ first }}〜{{ last }}件（{{ count }}件）</div>
</template>

<script>
import { mapGetters } from "vuex";

export default {
  name: "RakutenApiResultHit",
  computed: {
    ...mapGetters(["count", "first", "last"]),
  },
};
</script>

<style scoped></style>
