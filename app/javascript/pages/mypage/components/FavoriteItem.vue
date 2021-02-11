<template>
  <div class="card">
        <div class="card-image">
          <figure class="image">
            <img :src="item.image" />
          </figure>
            <div class="favorite-mark">
              <span v-if="isLiked" @click="unFavorite()"><b-icon icon="heart" size="is-midium" class="heart"></b-icon></span>
              <span v-else @click="favorite()"><b-icon icon="heart-outline" size="is-midium" class="heart-outline"></b-icon></span>
            </div>
        </div>
      <a target="_blank" :href="item.url">
        <div class="content">
          <p>
            <small>{{ sliceItemName(item.name) }}</small>
          </p>
          <p class="item-price">
            <big
              ><b>{{ item.price.toLocaleString() }}円</b></big
            >
          </p>
          <div class="columns">
            <star-rating
              v-model="item.review_average"
              :increment="0.01"
              read-only
              :star-size="15"
              class="column review-average"
            ></star-rating>
            <span class="column review-count"
              >({{ item.review_count.toLocaleString() }}件)</span
            >
          </div>
          <p>
            <b-icon icon="store-outline" size="is-small"> </b-icon>
            <small>{{ item.shop_name }}</small>
          </p>
        </div>
      </a>
  </div>
</template>

<script>
import { mapGetters } from "vuex";
export default {
  name: "FavoriteItem",
  props: {
    item: Object,
    required: true,
  },
  data() {
    return {
      isLiked: true,
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
    unFavorite() {
      this.$axios.delete('/v1/items/:item_id',
      {
        params: {
         item_id: this.item.id
      }
      })
        .then(res => {
          console.log(res)
        })
        .catch(err => {
          console.log(err)
        });
        this.isLiked = false
    },
    favorite() {
      this.$axios.post('/v1/items',
      {
        name: this.item.name,
        price: this.item.price,
        url: this.item.url,
        image: this.item.image,
        review_count: this.item.review_count,
        review_average: this.item.review_average,
        shop_name: this.item.shop_name,
        genre_id: this.item.genre_id,
        user_id: this.authUser.id,
        item_code: this.item.item_code,
      })
        .then(res => {
          console.log(res);
        })
        .catch(error => {
          this.errors = error.response.data.message
        });
          this.isLiked = true
    },
  }
}
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