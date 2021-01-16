<template>
<div>
  <div class="card">
    <p>{{ relationship_relative.relationship }}</p>
    <p>{{ relationship_relative.description }}</p>
    <p>{{ relationship_relative.market_price }}</p>
  </div>
  <div class="columns">
    <div v-for="relative_search_card in relative_search_cards">
      <div class="card" @click="search()" :value="relative_search_card.genreId">
        <div class="card-image">
          <figure class="image">
            <img :src="relative_search_card.image" alt = "ロゴ" />
          </figure>
          <p>{{ relative_search_card.name }}</p>
        </div>
      </div>
    </div>
  </div>
  <div class="card">
    <p>{{ relationship_friend.relationship }}</p>
    <p>{{ relationship_friend.description }}</p>
    <p>{{ relationship_friend.market_price }}</p>
  </div>
  <div class="card">
    <p>{{ relationship_colleague.relationship }}</p>
    <p>{{ relationship_colleague.description }}</p>
    <p>{{ relationship_colleague.market_price }}</p>
  </div>
  <div class="card">
    <p>{{ relationship_boss.relationship }}</p>
    <p>{{ relationship_boss.description }}</p>
    <p>{{ relationship_boss.market_price }}</p>
  </div>
</div>
</template>
<script>
import { mapActions } from 'vuex'
import { changeGenreId, search } from '../../../store/mutation-types'
export default {
  name: "RelationshipRakutenApiCall",
  data() {
    return {
      relationship_relative: 
        { 
          relationship: 'ご親族',
          description: '身内が結婚する場合は、質の良い、かつ実用性の高いものを贈りましょう。本人に直接聞いてから選んでも良いかもしれません。',
          market_price: '相場：30,000〜50,000円' 
        },
      relationship_friend:
        { 
          relationship: 'ご友人',
          description: '結婚を機に1人分から2人分へサイズ＆ランクアップしたいものは喜ばれるでしょう。友人同士が集まって、グループで贈ることで高価な品物を選んでもよいでしょう。',
          market_price: '相場：10,000〜30,000円（ただし、先に結婚祝いをもらっている場合は、その金額に合わせるのがマナーです。）'
        },
      relationship_colleague:
        { 
          relationship: '職場の同僚',
          description: '個性的なギフトではなく、より安全感のあるギフトを選びましょう。他の人と被ってしまっても大丈夫なように、いくつあっても困らないものがおすすめです。連名でのプレゼントであれば、新郎新婦のお返しの負担も少なくなるので受け取りやすいでしょう。',
          market_price: '相場：5,000円程度　連盟の場合は10,000〜20,000円（結婚祝いを贈る人数にもよりますが、高くてもひとり5000円以内に収めましょう。）'
        },
      relationship_boss:
        { 
          relationship: '職場の上司',
          description: '恩師や会社の上司等に贈る結婚祝いは、失礼にあたらないように注意しましょう。高価なものは逆に失礼になることもあるので、あくまで分相応な贈り物をするよう心がけましょう。',
          market_price: '相場：個人からでも、連盟の場合でも5,000円程度'
        },
      relative_search_cards: [
        { image: require("../../../../assets/images/kitchen_goods.jpg"), name: 'キッチン用品・食器', genreId: 558944 },
        { image: require("../../../../assets/images/home_electriv_appliances.jpg"), name: '家電', genreId: 562637 },
        { image: require("../../../../assets/images/catalog.jpg"), name: 'カタログ', genreId: 566732 },
        { image: require("../../../../assets/images/gift_certificate.jpg"), name: '商品券', genreId: 553283 },
      ],
      kitchen_goods_img: require("../../../../assets/images/kitchen_goods.jpg"),
    }
  },

  methods: {
    ...mapActions([
      "changeGenreId", "search"
    ]),
    // changeGenreIdSearch() {
    //   this.CHANGE_GENRE_ID()
    //   this.SEARCH()
    // }
  }
}
</script>
<style scoped>
</style>