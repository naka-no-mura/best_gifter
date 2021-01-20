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
      <div class="section">
        <div class="block">
          <p class="title">ご親族</p>
          <p>身内が結婚する場合は、質の良い、かつ実用性の高いものを贈りましょう。本人に直接聞いてから選んでも良いかもしれません。</p>
          <p>相場：30,000〜50,000円</p>
        </div>
        <div class="columns is-multiline">
          <div class="column is-2"
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
      <div class="section">
        <div class="block">
          <p class="title">ご友人</p>
          <p>結婚を機に1人分から2人分へサイズ＆ランクアップしたいものは喜ばれるでしょう。友人同士が集まって、グループで贈ることで高価な品物を選んでもよいでしょう。</p>
          <p>相場：10,000〜30,000円（ただし、先に結婚祝いをもらっている場合は、その金額に合わせるのがマナーです。）</p>
        </div>
        <div class="columns is-multiline">
          <div class="column is-2"
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
      <div class="section">
        <div class="block">
          <p class="title">職場の同僚</p>
          <p>個性的なギフトではなく、より安全感のあるギフトを選びましょう。他の人と被ってしまっても大丈夫なように、いくつあっても困らないものがおすすめです。連名でのプレゼントであれば、新郎新婦のお返しの負担も少なくなるので受け取りやすいでしょう。</p>
          <p>相場：5,000円程度 連盟の場合は10,000〜20,000円（結婚祝いを贈る人数にもよりますが、高くてもひとり5000円以内に収めましょう。）</p>
        </div>
        <div class="columns is-multiline">
          <div class="column is-2"
            v-for="colleague_search_card in colleague_search_cards"
            :key="colleague_search_card.id"
          >
            <div
              class="card"
              @click="
                changeGenreId(colleague_search_card.genreId);
                search();
                show = !show;
                relationship_genre_show = !relationship_genre_show;
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
      <div class="section">
        <div class="block">
          <p class="title">職場の上司</p>
          <p>個性的なギフトではなく、より安全感のあるギフトを選びましょう。他の人と被ってしまっても大丈夫なように、いくつあっても困らないものがおすすめです。連名でのプレゼントであれば、新郎新婦のお返しの負担も少なくなるので受け取りやすいでしょう。</p>
          <p>相場：個人からでも、連盟の場合でも5,000円程度</p>
        </div>
        <div class="columns is-multiline">
          <div class="column is-2"
            v-for="boss_search_card in boss_search_cards"
            :key="boss_search_card.id"
          >
            <div
              class="card"
              @click="
                changeGenreId(boss_search_card.genreId);
                search();
                show = !show;
                relationship_genre_show = !relationship_genre_show;
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
    props: {
    items: Array,
    required: true
  },
  data() {
    return {
      show: true,
      relationship_genre_show: false,
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
