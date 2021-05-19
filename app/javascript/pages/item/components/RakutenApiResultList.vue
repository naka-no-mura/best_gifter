<template>
  <div class="container items-box">
    <template v-for="item in items">
      <div
        :key="item.id"
        class="item-box"
      >
        <RakutenApiResultItem
          :item="item"
        />
      </div>
    </template>
    <div v-if="hits === 0">
      <section class="reset-box">
        <div class="block">
          ご指定の検索条件に該当する商品はみつかりませんでした
        </div>
      <div>
        <b-button
          type="is-danger"
          class="reset-btn"
          expanded
          @click="reset()"
        >
          検索条件をリセットする
          <b-icon
              icon="arrow-right-drop-circle-outline"
              size="is-small"
            />
        </b-button>
      </div>
        <img src="../../../../assets/images/top_image_pink.JPG">
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
  methods: {
    reset() {
      this.$router.go({ path: this.$router.currentRoute.path, force: true });
    },
  }
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
.reset-btn {
  margin: 2rem auto;
}
.reset-box {
  text-align: center;
}
.reset-btn {
  margin-bottom: 2rem;
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
