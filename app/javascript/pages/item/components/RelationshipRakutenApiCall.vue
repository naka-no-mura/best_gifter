<template>
  <div>
    <div>
      <b-button
        type="is-primary"
        v-show="relationship_genre_show"
        @click="
          show = !show;
          relationship_genre_show = !relationship_genre_show;
        "
        >間柄別のジャンルを表示する</b-button
      >
    </div>
    <div v-show="show">
      <!-- ご親族 -->
      <div>
        <div class="card">
          <p>{{ relationship_relative.relationship }}</p>
          <p>{{ relationship_relative.description }}</p>
          <p>{{ relationship_relative.market_price }}</p>
        </div>
        <div class="columns">
          <div
            v-for="relative_search_card in relative_search_cards"
            :key="relative_search_card.id"
          >
            <div
              class="card"
              @click="
                changeGenreId(relative_search_card.genreId);
                search();
                show = !show;
                relationship_genre_show = !relationship_genre_show;
              "
              :value="relative_search_card.genreId"
            >
              <div class="card-image">
                <figure class="image">
                  <img :src="relative_search_card.image" alt="ロゴ" />
                </figure>
                <p>{{ relative_search_card.name }}</p>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!-- ご友人 -->
      <div>
        <div class="card">
          <p>{{ relationship_friend.relationship }}</p>
          <p>{{ relationship_friend.description }}</p>
          <p>{{ relationship_friend.market_price }}</p>
        </div>
        <div class="columns">
          <div
            v-for="friend_search_card in friend_search_cards"
            :key="friend_search_card.id"
          >
            <div
              class="card"
              @click="
                changeGenreId(friend_search_card.genreId);
                search();
                show = !show;
                relationship_genre_show = !relationship_genre_show;
              "
              :value="friend_search_card.genreId"
            >
              <div class="card-image">
                <figure class="image">
                  <img :src="friend_search_card.image" alt="ロゴ" />
                </figure>
                <p>{{ friend_search_card.name }}</p>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!-- 職場の同僚 -->
      <div>
        <div class="card">
          <p>{{ relationship_colleague.relationship }}</p>
          <p>{{ relationship_colleague.description }}</p>
          <p>{{ relationship_colleague.market_price }}</p>
        </div>
        <div class="columns">
          <div
            v-for="colleague_search_card in colleague_search_cards"
            :key="colleague_search_card.id"
          >
            <div
              class="card"
              @click="
                changeGenreId(colleague_search_card.genreId);
                search();
              "
              :value="colleague_search_card.genreId"
            >
              <div class="card-image">
                <figure class="image">
                  <img :src="colleague_search_card.image" alt="ロゴ" />
                </figure>
                <p>{{ colleague_search_card.name }}</p>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!-- 職場の上司 -->
      <div>
        <div class="card">
          <p>{{ relationship_boss.relationship }}</p>
          <p>{{ relationship_boss.description }}</p>
          <p>{{ relationship_boss.market_price }}</p>
        </div>
        <div class="columns">
          <div
            v-for="boss_search_card in boss_search_cards"
            :key="boss_search_card.id"
          >
            <div
              class="card"
              @click="
                changeGenreId(boss_search_card.genreId);
                search();
              "
              :value="boss_search_card.genreId"
            >
              <div class="card-image">
                <figure class="image">
                  <img :src="boss_search_card.image" alt="ロゴ" />
                </figure>
                <p>{{ boss_search_card.name }}</p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
import { mapActions } from "vuex";
import { changeGenreId, search } from "../../../store/mutation-types";
export default {
  name: "RelationshipRakutenApiCall",
  data() {
    return {
      show: true,
      relationship_genre_show: false,
      relationship_relative: {
        relationship: "ご親族",
        description:
          "身内が結婚する場合は、質の良い、かつ実用性の高いものを贈りましょう。本人に直接聞いてから選んでも良いかもしれません。",
        market_price: "相場：30,000〜50,000円",
      },
      relationship_friend: {
        relationship: "ご友人",
        description:
          "結婚を機に1人分から2人分へサイズ＆ランクアップしたいものは喜ばれるでしょう。友人同士が集まって、グループで贈ることで高価な品物を選んでもよいでしょう。",
        market_price:
          "相場：10,000〜30,000円（ただし、先に結婚祝いをもらっている場合は、その金額に合わせるのがマナーです。）",
      },
      relationship_colleague: {
        relationship: "職場の同僚",
        description:
          "個性的なギフトではなく、より安全感のあるギフトを選びましょう。他の人と被ってしまっても大丈夫なように、いくつあっても困らないものがおすすめです。連名でのプレゼントであれば、新郎新婦のお返しの負担も少なくなるので受け取りやすいでしょう。",
        market_price:
          "相場：5,000円程度 連盟の場合は10,000〜20,000円（結婚祝いを贈る人数にもよりますが、高くてもひとり5000円以内に収めましょう。）",
      },
      relationship_boss: {
        relationship: "職場の上司",
        description:
          "恩師や会社の上司等に贈る結婚祝いは、失礼にあたらないように注意しましょう。高価なものは逆に失礼になることもあるので、あくまで分相応な贈り物をするよう心がけましょう。",
        market_price: "相場：個人からでも、連盟の場合でも5,000円程度",
      },
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
    ...mapActions(["changeGenreId", "search"]),
  },
};
</script>
<style scoped></style>
