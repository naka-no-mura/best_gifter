<template>
  <div>
    <div class="columns is-multiline">
      <template v-for="item in items">
        <div class="column is-3">
          <RakutenApiResultItem :key="item.id" :item="item" />
        </div>
      </template>
    </div>
  </div>
</template>

<script>
import RakutenApiResultItem from "./RakutenApiResultItem";
import { mapGetters } from "vuex";
export default {
  name: "RakutenApiResultList",
  components: {
    RakutenApiResultItem,
  },
  computed: {
    ...mapGetters(["items", "currentPage", "pageCount", "reviewCount", "reviewAverage"]),
  },
};
</script>

<style scope></style>
