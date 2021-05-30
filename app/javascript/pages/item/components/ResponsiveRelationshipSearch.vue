<template>
  <!-- スマホバージョン -->
  <div class="block responsive-genre-search">
    <!-- 友人 -->
    <div class="select is-small genre-select">
      <select
        v-model="friend_genreIdSelected"
        class="rs-genre"
        @change="
          changeGenreId(friend_genreIdSelected);
          friendSetPage(1);
          changeMinPrice(10000);
          changeMaxPrice(30000);
          pageToTop();
        "
      >
        <option disabled>
          友人
        </option>
        <option
          v-for="friend_search_card in friend_search_cards"
          :key="friend_search_card.id"
          :value="friend_search_card.genreId"
        >
          {{ friend_search_card.name }}
        </option>
      </select>
    </div>
    <!-- 親族 -->
    <div class="select is-small genre-select">
      <select
        v-model="relative_genreIdSelected"
        class="rs-genre"
        @change="
          changeGenreId(relative_genreIdSelected);
          relativeSetPage(1);
          changeMinPrice(30000);
          changeMaxPrice(50000);
          pageToTop();
        "
      >
        <option disabled>
          親族
        </option>
        <option
          v-for="relative_search_card in relative_search_cards"
          :key="relative_search_card.id"
          :value="relative_search_card.genreId"
        >
          {{ relative_search_card.name }}
        </option>
      </select>
    </div>
    <!-- 同僚 -->
    <div class="select is-small genre-select">
      <select
        v-model="colleague_genreIdSelected"
        class="rs-genre"
        @change="
          changeGenreId(colleague_genreIdSelected);
          colleagueSetPage(1);
          changeMinPrice(10000);
          changeMaxPrice(20000);
          pageToTop();
        "
      >
        <option disabled>
          同僚
        </option>
        <option
          v-for="colleague_search_card in colleague_search_cards"
          :key="colleague_search_card.id"
          :value="colleague_search_card.genreId"
        >
          {{ colleague_search_card.name }}
        </option>
      </select>
    </div>
    <!-- 上司 -->
    <div class="select is-small genre-select">
      <select
        v-model="boss_genreIdSelected"
        class="rs-genre"
        @change="
          changeGenreId(boss_genreIdSelected);
          bossSetPage(1);
          changeMinPrice(1000);
          changeMaxPrice(5000);
          pageToTop();
        "
      >
        <option disabled>
          上司
        </option>
        <option
          v-for="boss_search_card in boss_search_cards"
          :key="boss_search_card.id"
          :value="boss_search_card.genreId"
        >
          {{ boss_search_card.name }}
        </option>
      </select>
    </div>
  </div>
</template>
<script>
import { mapActions } from "vuex";
import {
  changeKeyword,
  changeGenreId,
  changeMinPrice,
  changeMaxPrice,
  changeSort,
  changePage,
  search,
  genreSearch,
} from "../../../store/mutation-types";
export default {
  name: "ResponsiveRelationshipSearch",
  data() {
    return {
      friend_genreIdSelected:'友人',
      relative_genreIdSelected:'親族',
      colleague_genreIdSelected:'同僚',
      boss_genreIdSelected:'上司',
      // ジャンルごとのパネル検索用
      // 親族パネル
      relative_search_cards: [
        {
          name: "キッチン用品・食器",
          genreId: 558944,
        },
        {
          name: "インテリア・雑貨",
          genreId: 100804,
        },
        {
          name: "家電",
          genreId: 562637,
        },
        {
          name: "カタログ",
          genreId: 566732,
        },
        {
          name: "商品券",
          genreId: 553283,
        },
      ],
      // 友人パネル
      friend_search_cards: [
        {
          name: "インテリア・雑貨",
          genreId: 100804,
        },
        {
          name: "日用品雑貨",
          genreId: 215783,
        },
        {
          name: "ルームウエア",
          genreId: 100433,
        },
        {
          name: "キッチン用品・食器",
          genreId: 558944,
        },
        {
          name: "家電",
          genreId: 562637,
        },
        {
          name: "カタログ",
          genreId: 566732,
        },
        {
          name: "商品券",
          genreId: 553283,
        },
      ],
      // 職場の同僚パネル
      colleague_search_cards: [
        {
          name: "花",
          genreId: 100005,
        },
        {
          name: "日用品雑貨",
          genreId: 215783,
        },
        {
          name: "カタログ",
          genreId: 566732,
        },
        {
          name: "商品券",
          genreId: 553283,
        },
      ],
      // 職場の上司パネル
      boss_search_cards: [
        {
          name: "洋酒",
          genreId: 510915,
        },
        {
          name: "キッチン用品・食器",
          genreId: 558944,
        },
        {
          name: "カタログ",
          genreId: 566732,
        },
        {
          name: "商品券",
          genreId: 553283,
        },
      ],
    };
  },

  methods: {
    ...mapActions("rakuten_api", [
      "changeGenreId",
      "changeMinPrice",
      "changeMaxPrice",
      "search",
      "genreSearch",
      "friendGenreSearch",
      "relativeGenreSearch",
      "colleagueGenreSearch",
      "bossGenreSearch",
      "changePage",
      "setPage",
    ]),
    //友人のジャンルで検索の時は毎回1ページ目を表示させる
    friendSetPage(page) {
      var vm = this;
      vm.friendGenreSearch(vm.changePage(page));
    },
    //親族のジャンルで検索の時は毎回1ページ目を表示させる
    relativeSetPage(page) {
      var vm = this;
      vm.relativeGenreSearch(vm.changePage(page));
    },
    //同僚のジャンルで検索の時は毎回1ページ目を表示させる
    colleagueSetPage(page) {
      var vm = this;
      vm.colleagueGenreSearch(vm.changePage(page));
    },
    //上司のジャンルで検索の時は毎回1ページ目を表示させる
    bossSetPage(page) {
      var vm = this;
      vm.bossGenreSearch(vm.changePage(page));
    },
    pageToTop() {
      window.scrollTo({
        top: 0,
        behavior: "auto",
      });
    },
  },
};
</script>
<style scope>
@media screen and (max-width: 959px) {
  .responsive-genre-search {
    width: 100%;
    padding: 9.3rem 0.5rem 0.5rem;
    position: fixed;
    z-index: 28;
    background-color: #f0eee9;
  }
  .genre-select {
    max-width: 23% !important;
  }
}

@media screen and (max-width: 480px) {
  .responsive-genre-search {
    width: 100%;
    padding: 5.3rem 0.5rem 0.5rem;
    position: fixed;
    z-index: 28;
    background-color: #f0eee9;
  }
  .genre-select {
    max-width: 23% !important;
  }
}
</style>
