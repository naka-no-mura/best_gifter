<template>
<div class="container item-box">
    <div class="columns is-multiline">
      <template v-for="item in items">
        <div class="column is-3">
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
    ...mapGetters("rakuten_api", [
      "items",
      "currentPage",
      "pageCount",
      "reviewCount",
      "reviewAverage",
      "hits",
      "itemCode",
    ]),
  },
};
</script>

<style scope>
.item-box {
  border-top: 0.5px solid #d3d3d3;
  border-bottom: 0.5px solid #d3d3d3;
  padding: 2rem 0rem;
}
</style>
