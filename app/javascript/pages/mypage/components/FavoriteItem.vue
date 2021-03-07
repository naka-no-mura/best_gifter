<template>
  <div class="tile is-parent">
    <a target="_blank" :href="item.url" class="item-url">
      <div class="mask">
        <p class="caption"><b>READ MORE</b></p>
      </div>
    </a>
    <article class="tile is-child tile-image">
      <div class="favorite-mark">
        <span v-if="isLiked" @click="unFavorite()"
          ><b-icon icon="star" size="is-midium" class="star"></b-icon
        ></span>
        <span v-else @click="favorite()"
          ><b-icon
            icon="star-outline"
            size="is-midium"
            class="star-outline"
          ></b-icon
        ></span>
      </div>
      <figure class="image">
        <img :src="item.image" class="item-img" />
      </figure>
      <div class="content">
        <p>
          <small>{{ sliceItemName(item.name) }}</small>
        </p>
        <p class="item-price">
          <big
            ><b>{{ item.price.toLocaleString() }}円</b></big
          >
        </p>
        <div class="review-box">
          <small
            ><star-rating
              v-model="item.review_average"
              :increment="0.01"
              read-only
              :star-size="15"
              class="review-average"
            ></star-rating
          ></small>
          <small
            ><span class="review-count"
              >{{ item.review_count.toLocaleString() }}件</span
            ></small
          >
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
    item: Object,
    required: true,
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
</style>
