<template>
  <div class="container items-box">
      <template v-for="item in items">
        <div class="item-box">
          <RakutenApiResultItem :key="item.id" :item="item" />
        </div>
      </template>
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
.items-box {
  border-top: 0.5px solid #d3d3d3;
  border-bottom: 0.5px solid #d3d3d3;
  padding: 2rem 0rem;
  display: flex;
  flex-wrap: wrap;
  justify-content: center;
  margin: 0 auto;
}
.item-box {
  width: 21%;
  margin: 1rem;
}
@media screen and (max-width: 959px) {
.item-box {
  width: 45%;
}
}
@media screen and (max-width: 480px) {
.items-box {
  border-top: 0.5px solid #d3d3d3;
  border-bottom: 0.5px solid #d3d3d3;
  padding: 1rem 0rem;
  display: block;
  flex-wrap: wrap;
  margin: 0 auto;
}
.item-box {
  width: 95%;
  margin: 1rem auto;
}
}
</style>
