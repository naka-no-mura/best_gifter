<template>
  <div>
    <div class="card">
        <div class="card-image">
          <figure class="image">
            <img :src="item.Item.mediumImageUrls[0].imageUrl" />
          </figure>
            <div class="favorite-mark">
              <span v-if="isLiked" @click="favorite()"><b-icon icon="heart" size="is-midium" class="heart"></b-icon></span>
              <span v-else @click="favorite()"><b-icon icon="heart-outline" size="is-midium" class="heart-outline"></b-icon></span>
            </div>
        </div>
      <a target="_blank" :href="item.Item.itemUrl">
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
      </a>
    </div>
  </div>
</template>

<script>
import { mapGetters } from "vuex";
export default {
  name: "RakutenApiResultItem",
  props: {
    item: Object,
    required: true,
  },
  data() {
    return {
      isLiked: false,
    }
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
        user_id: this.authUser.id,
        item_code: this.item.Item.itemCode
      })
        .then(res => {
          console.log(res);
        })
        .catch(error => {
          this.errors = error.response.data.message
          this.$toasted.show(this.errors);
        });
          this.isLiked = true
    },
  },
};
</script>
<style lang="scss">
.card {
  a {
    color: #4a4a4a;
  }
}
.card-image {
  position: relative;
}
.favorite-mark {
  position: absolute;
  right: 0.5rem;
  top: 0.5rem;
  background-color: white;
  border: #999;
  border-radius: 3px;
}
.content {
  margin: 0.5rem;
}
.content:hover {
  opacity: 0.5;
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
.heart {
  color: #ffd3d4;
}
.heart-outline {
  color: #ffd3d4;
}
</style>
