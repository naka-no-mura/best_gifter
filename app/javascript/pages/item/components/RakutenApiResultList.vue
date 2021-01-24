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
import { mapGetters, mapActions } from "vuex";
import { changePage } from "../../../store/mutation-types";
export default {
  name: "RakutenApiResultList",
  components: {
    RakutenApiResultItem,
  },
  data() {
    return {};
  },
  computed: {
    ...mapGetters(["items", "currentPage", "pageCount", "reviewCount", "reviewAverage"]),
  },
  methods: {
    ...mapActions(["changePage", "search"]),
  },
};
</script>

<style scope></style>
