<template>
  <div>
    <div class="columns is-multiline">
      <template v-for="item in items">
        <div class="column is-2">
          <RakutenApiResultItem :key="item.id" :item="item" />
        </div>
      </template>
    </div>
    <div v-if="hits === 0">
      <section>
        <div class="block">
          ご指定の検索条件に該当する商品はみつかりませんでした
        </div>
        <img src="../../../../assets/images/empty.jpg" />
      </section>
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
    ...mapGetters([
      "items",
      "currentPage",
      "pageCount",
      "reviewCount",
      "reviewAverage",
      "hits",
    ]),
  },
};
</script>

<style scope></style>
