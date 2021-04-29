<template>
  <div class="tile is-parent">
    <a
      target="_blank"
      :href="item.url"
      class="item-url"
    >
      <div class="mask">
        <p class="caption"><b>READ MORE</b></p>
      </div>
    </a>
    <article class="tile is-child tile-image">
      <div class="favorite-mark">
        <span
          v-if="isLiked"
          id="my-is-liked"
          @click="unFavorite()"
        ><b-icon
          icon="star"
          size="is-midium"
          class="star"
        /></span>
        <span
          v-else
          id="my-is-not-liked"
          @click="favorite()"
        ><b-icon
          icon="star-outline"
          size="is-midium"
          class="star-outline"
        /></span>
      </div>
      <figure class="image">
        <img
          :src="item.image"
          class="item-img"
        >
      </figure>
      <div class="content">
        <p>
          <small>{{ sliceItemName(item.name) }}</small>
        </p>
        <p class="item-price">
          <big>
            <b>{{ item.price.toLocaleString() }}円</b>
          </big>
        </p>
        <div class="review-box">
          <small><star-rating
            v-model="item.review_average"
            :increment="0.01"
            read-only
            :star-size="15"
            class="review-average"
          /></small>
          <small><span
            class="review-count"
          >{{ item.review_count.toLocaleString() }}件</span></small>
        </div>
      </div>
    </article>
  </div>
</template>

<script>
import { mapGetters } from "vuex";
export default {
  name: "FavoriteItem",
  props: {
    item: {
      type: Object,
      required: true,
    }
  },
  data() {
    return {
      isLiked: true,
    };
  },
  computed: {
    ...mapGetters("users", ["authUser"]),
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
      this.$axios
        .delete("/v1/items/:item_id", {
          params: {
            item_id: this.item.id,
          },
        })
        .then((res) => {
          console.log(res);
        })
        .catch((err) => {
          console.log(err);
        });
      this.isLiked = false;
    },
    favorite() {
      this.$axios
        .post("/v1/items", {
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
        .then((res) => {
          console.log(res);
        })
        .catch((error) => {
          this.errors = error.response.data.message;
        });
      this.isLiked = true;
    },
  },
};
</script>

<style scope>
.is-parent {
  background-color: white;
  border-radius: 20px;
  border: 5px solid white;
  transition: 0.3s;
  position: relative;
}
.is-parent:hover {
  border: 5px solid #ffd3d4;
  filter: #999999;
}
.mask {
  position: absolute;
  width: 100%;
  height: 100%;
  top: 0;
  left: 0;
  z-index: 10;
  background-color: rgba(0, 0, 0, 0.2);
  transition: 0.3s;
  opacity: 0;
  -webkit-transition: all 0.3s;
  border-radius: 15px;
  text-align: center;
}
.mask:hover {
  opacity: 1;
}
.caption {
  text-align: center;
  color: white;
  margin-top: 10rem;
  font-size: 140%;
}
.favorite-mark {
  position: absolute;
  right: 0.5rem;
  top: 0.5rem;
  background-color: white;
  border: #999;
  border-radius: 3px;
  z-index: 10;
}
.star {
  color: #ff694b;
}
.star-outline {
  color: #ff694b;
}
</style>
