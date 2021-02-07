<template>
  <div>
    <div class="card">
      <a target="_blank" :href="item.Item.itemUrl">
        <div class="card-image">
          <figure class="image">
            <img :src="item.Item.mediumImageUrls[0].imageUrl" />
          </figure>
        </div>
      </a>
        <div class="content">
          <p>
            <small>{{ sliceItemName(item.Item.itemName) }}</small>
          </p>
          <p class="item-price">
            <big
              ><b>{{ item.Item.itemPrice.toLocaleString() }}円</b></big
            >
          </p>
          <div class="columns">
            <star-rating
              v-model="item.Item.reviewAverage"
              :increment="0.01"
              read-only
              :star-size="15"
              class="column review-average"
            ></star-rating>
            <span class="column review-count"
              >({{ item.Item.reviewCount.toLocaleString() }}件)</span
            >
          </div>
          <p>
            <b-icon icon="store-outline" size="is-small"> </b-icon>
            <small>{{ item.Item.shopName }}</small>
          </p>
        </div>
        <p @click="favorite()"><b-icon icon="heart-outline" size="is-medium"></b-icon></p>
    </div>
  </div>
</template>

<script>
import { mapGetters } from "vuex"
export default {
  name: "RakutenApiResultItem",
  props: {
    item: Object,
    required: true,
  },
  computed: {
    ...mapGetters("users", ["authUser"])
  },
  methods: {
    sliceItemName(itemName) {
      if (itemName.length > 35) {
        return itemName.slice(0, 35) + "...";
      } else {
        return itemName;
      }
    },
    favorite() {
      this.$axios.post('/v1/items',
      {
        name: this.item.Item.itemName,
        price: this.item.Item.itemPrice,
        url: this.item.Item.itemUrl,
        image: this.item.Item.mediumImageUrls[0].imageUrl,
        review_count: this.item.Item.reviewCount,
        review_average: this.item.Item.reviewAverage,
        shop_name: this.item.Item.shopName,
        genre_id: this.item.Item.genreId,
        user_id: this.authUser.id
      })
        .then(res => {
          console.log(res)
        })
        .catch(err => {
          console.log(err)
        })
    }
  },
};
</script>
<style lang="scss">
.card {
  a {
    color: #4a4a4a;
  }
}
.card:hover {
  opacity: 0.5;
}
.content {
  margin: 0.5rem;
}
.item-price {
  color: red;
}
.review-average {
  color: orange;
}
.review-count {
  color: #999;
}
</style>
