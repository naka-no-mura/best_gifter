<template>
  <div class="p-1">
    <b-menu class="is-custom-mobile">
      <b-menu-list label="間柄別ジャンルで選ぶ">
        <!-- ご友人 -->
        <b-menu-list>
          <b-menu-item label="ご友人">
            <b-menu-item
              v-for="friend_search_card in friend_search_cards"
              :key="friend_search_card.id"
              :label="friend_search_card.name"
              :value="friend_search_card.genreId"
              @click="
                changeGenreId(friend_search_card.genreId);
                changeMinPrice(10000);
                changeMaxPrice(30000);
                friendSetPage(1);
              "
            />
          </b-menu-item>
        </b-menu-list>
        <!-- ご親族 -->
        <b-menu-list>
          <b-menu-item label="ご親族">
            <b-menu-item
              v-for="relative_search_card in relative_search_cards"
              :key="relative_search_card.id"
              :label="relative_search_card.name"
              :value="relative_search_card.genreId"
              @click="
                changeGenreId(relative_search_card.genreId);
                changeMinPrice(30000);
                changeMaxPrice(50000);
                relativeSetPage(1);
              "
            />
          </b-menu-item>
        </b-menu-list>
        <!-- 職場の同僚 -->
        <b-menu-list>
          <b-menu-item label="職場の同僚">
            <b-menu-item
              v-for="colleague_search_card in colleague_search_cards"
              :key="colleague_search_card.id"
              :label="colleague_search_card.name"
              :value="colleague_search_card.genreId"
              @click="
                changeGenreId(colleague_search_card.genreId);
                changeMinPrice(10000);
                changeMaxPrice(20000);
                colleagueSetPage(1);
              "
            />
          </b-menu-item>
        </b-menu-list>
        <!-- 職場の上司 -->
        <b-menu-list>
          <b-menu-item label="職場の上司">
            <b-menu-item
              v-for="boss_search_card in boss_search_cards"
              :key="boss_search_card.id"
              :label="boss_search_card.name"
              :value="boss_search_card.genreId"
              @click="
                changeGenreId(boss_search_card.genreId);
                changeMinPrice(1000);
                changeMaxPrice(5000);
                bossSetPage(1);
              "
            />
          </b-menu-item>
        </b-menu-list>
      </b-menu-list>
    </b-menu>
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
  name: "RakutenApiSideMenu",
  data() {
    return {
      expandOnHover: false,
      mobile: "reduce",
      reduce: false,
      // フォーム部分(プルダウン)のジャンル検索用
      genreIds: [
        { genreId: 100433, name: "ルームウェア" },
        { genreId: 562637, name: "家電" },
        { genreId: 510915, name: "洋酒" },
        { genreId: 100804, name: "インテリア" },
        { genreId: 215783, name: "日用品雑貨" },
        { genreId: 558944, name: "キッチン用品・食器" },
        { genreId: 100005, name: "花" },
        { genreId: 566732, name: "カタログ" },
        { genreId: 553283, name: "ギフト券・商品券" },
      ],
      genreId_selected: "",
      // フォーム部分(プルダウン)の並び替え用
      sorts: [
        { sort: "standard", name: "標準" },
        { sort: "+reviewCount", name: "レビュー件数順" },
        { sort: "+reviewAverage", name: "レビュー評価順" },
        { sort: "-itemPrice", name: "価格が高い順" },
        { sort: "+itemPrice", name: "価格が安い順" },
        { sort: "+updateTimestamp", name: "新着順" },
      ],
      sort_selected: { sort: "standard", name: "標準" },
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
      "changeKeyword",
      "changeGenreId",
      "changeMinPrice",
      "changeMaxPrice",
      "changeSort",
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
  },
};
</script>
<style scope>
.p-1 {
  padding: 1em;
}
</style>
