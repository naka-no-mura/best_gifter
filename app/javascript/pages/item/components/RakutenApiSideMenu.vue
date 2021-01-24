<template>
  <div class="sidebar-page">
    <section class="sidebar-layout">
      <b-sidebar
        position="static"
        :mobile="mobile"
        :expand-on-hover="expandOnHover"
        :reduce="reduce"
        type="is-light"
        open
      >
        <div class="p-1">
          <b-menu class="is-custom-mobile">
            <b-menu-list label="間柄別ジャンル">
              <!-- ご親族 -->
              <b-menu-item expanded label="ご親族">
                <b-menu-item
                  v-for="relative_search_card in relative_search_cards"
                  :key="relative_search_card.id"
                  @click="
                    changeGenreId(relative_search_card.genreId);
                    search();
                  "
                  :label="relative_search_card.name"
                  :value="relative_search_card.genreId"
                >
                </b-menu-item>
              </b-menu-item>
              <!-- ご友人 -->
              <b-menu-item expanded label="ご友人">
                <b-menu-item
                  v-for="friend_search_card in friend_search_cards"
                  :key="friend_search_card.id"
                  @click="
                    changeGenreId(friend_search_card.genreId);
                    search();
                  "
                  :label="friend_search_card.name"
                  :value="friend_search_card.genreId"
                >
                </b-menu-item>
              </b-menu-item>
              <!-- 職場の同僚 -->
              <b-menu-item expanded label="職場の同僚">
                <b-menu-item
                  v-for="colleague_search_card in colleague_search_cards"
                  :key="colleague_search_card.id"
                  @click="
                    changeGenreId(colleague_search_card.genreId);
                    search();
                  "
                  :label="colleague_search_card.name"
                  :value="colleague_search_card.genreId"
                >
                </b-menu-item>
              </b-menu-item>
              <!-- 職場の上司 -->
              <b-menu-item expanded label="職場の上司">
                <b-menu-item
                  v-for="boss_search_card in boss_search_cards"
                  :key="boss_search_card.id"
                  @click="
                    changeGenreId(boss_search_card.genreId);
                    search();
                  "
                  :label="boss_search_card.name"
                  :value="boss_search_card.genreId"
                >
                </b-menu-item>
              </b-menu-item>
            </b-menu-list>
          </b-menu>
        </div>
      </b-sidebar>
    </section>
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
  search,
} from "../../../store/mutation-types";
export default {
  name: "RakutenApiSideMenu",
  props: {
    items: Array,
    required: true,
  },
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
          image: require("../../../../assets/images/kitchen_goods.jpg"),
        },
        {
          name: "インテリア・雑貨",
          genreId: 100804,
          image: require("../../../../assets/images/interior.jpg"),
        },
        {
          name: "家電",
          genreId: 562637,
          image: require("../../../../assets/images/home_electriv_appliances.jpg"),
        },
        {
          name: "カタログ",
          genreId: 566732,
          image: require("../../../../assets/images/catalog.jpg"),
        },
        {
          name: "商品券",
          genreId: 553283,
          image: require("../../../../assets/images/gift_certificate.jpg"),
        },
      ],
      // 友人パネル
      friend_search_cards: [
        {
          name: "インテリア・雑貨",
          genreId: 100804,
          image: require("../../../../assets/images/interior.jpg"),
        },
        {
          name: "日用品雑貨",
          genreId: 215783,
          image: require("../../../../assets/images/daily_necessaries.jpg"),
        },
        {
          name: "ルームウエア",
          genreId: 100433,
          image: require("../../../../assets/images/loungwear.jpg"),
        },
        {
          name: "キッチン用品・食器",
          genreId: 558944,
          image: require("../../../../assets/images/kitchen_goods.jpg"),
        },
        {
          name: "家電",
          genreId: 562637,
          image: require("../../../../assets/images/home_electriv_appliances.jpg"),
        },
        {
          name: "カタログ",
          genreId: 566732,
          image: require("../../../../assets/images/catalog.jpg"),
        },
        {
          name: "商品券",
          genreId: 553283,
          image: require("../../../../assets/images/gift_certificate.jpg"),
        },
      ],
      // 職場の同僚パネル
      colleague_search_cards: [
        {
          name: "花",
          genreId: 100005,
          image: require("../../../../assets/images/flower.jpg"),
        },
        {
          name: "日用品雑貨",
          genreId: 215783,
          image: require("../../../../assets/images/daily_necessaries.jpg"),
        },
        {
          name: "カタログ",
          genreId: 566732,
          image: require("../../../../assets/images/catalog.jpg"),
        },
        {
          name: "商品券",
          genreId: 553283,
          image: require("../../../../assets/images/gift_certificate.jpg"),
        },
      ],
      // 職場の上司パネル
      boss_search_cards: [
        {
          name: "洋酒",
          genreId: 510915,
          image: require("../../../../assets/images/wine.jpg"),
        },
        {
          name: "キッチン用品・食器",
          genreId: 558944,
          image: require("../../../../assets/images/kitchen_goods.jpg"),
        },
        {
          name: "カタログ",
          genreId: 566732,
          image: require("../../../../assets/images/catalog.jpg"),
        },
        {
          name: "商品券",
          genreId: 553283,
          image: require("../../../../assets/images/gift_certificate.jpg"),
        },
      ],
    };
  },

  methods: {
    ...mapActions([
      "changeKeyword",
      "changeGenreId",
      "changeMinPrice",
      "changeMaxPrice",
      "changeSort",
      "search",
    ]),
  },
};
</script>
<style lang="scss">
.select_box {
  width: 10rem;
}
.p-1 {
  padding: 1em;
}
.sidebar-page {
  display: flex;
  flex-direction: column;
  width: 100%;
  min-height: 100%;
  // min-height: 100vh;
  .sidebar-layout {
    display: flex;
    flex-direction: row;
    min-height: 100%;
    // min-height: 100vh;
  }
}
@media screen and (max-width: 1023px) {
  .b-sidebar {
    .sidebar-content {
      &.is-mini-mobile {
        &:not(.is-mini-expand),
        &.is-mini-expand:not(:hover) {
          .menu-list {
            li {
              a {
                span:nth-child(2) {
                  display: none;
                }
              }
              ul {
                padding-left: 0;
                li {
                  a {
                    display: inline-block;
                  }
                }
              }
            }
          }
          .menu-label:not(:last-child) {
            margin-bottom: 0;
          }
        }
      }
    }
  }
}
@media screen and (min-width: 1024px) {
  .b-sidebar {
    .sidebar-content {
      &.is-mini {
        &:not(.is-mini-expand),
        &.is-mini-expand:not(:hover) {
          .menu-list {
            li {
              a {
                span:nth-child(2) {
                  display: none;
                }
              }
              ul {
                padding-left: 0;
                li {
                  a {
                    display: inline-block;
                  }
                }
              }
            }
          }
          .menu-label:not(:last-child) {
            margin-bottom: 0;
          }
        }
      }
    }
  }
}
.is-mini-expand {
  .menu-list a {
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
  }
}
</style>
