<template>
  <div class="tile is-parent">
    <a target="_blank" :href="item.Item.itemUrl">
      <div class="mask">
        <p class="caption"><b>READ MORE</b></p>
      </div>
    </a>
    <article class="tile is-child tile-image">
      <!-- お気に入りマーク -->
      <div class="favorite-mark" v-if="authUser">
        <span v-if="isLiked" @click="favorite()"
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
      <!-- お気に入りマーク ここまで-->
      <figure class="image image-box">
        <img
          :src="item.Item.mediumImageUrls[0].imageUrl"
          alt=""
          @error="altImg()"
          class="item-img"
        />
      </figure>
      <div class="content">
        <p>
          <small>{{ sliceItemName(item.Item.itemName) }}</small>
        </p>
        <p class="item-price">
          <big
            ><b>{{ item.Item.itemPrice.toLocaleString() }}円</b></big
          >
        </p>
        <div class="review-box">
          <small
            ><star-rating
              v-model="item.Item.reviewAverage"
              :increment="0.01"
              read-only
              :star-size="15"
              class="review-average"
            ></star-rating
          ></small>
          <small
            ><span class="review-count"
              >{{ item.Item.reviewCount.toLocaleString() }}件</span
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
  name: "RakutenApiResultItem",
  props: {
    item: Object,
  },
  data() {
    return {
      isLiked: false,
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
    favorite() {
      this.$axios
        .post("/v1/items", {
          name: this.item.Item.itemName,
          price: this.item.Item.itemPrice,
          url: this.item.Item.itemUrl,
          image: this.item.Item.mediumImageUrls[0].imageUrl,
          review_count: this.item.Item.reviewCount,
          review_average: this.item.Item.reviewAverage,
          shop_name: this.item.Item.shopName,
          genre_id: this.item.Item.genreId,
          user_id: this.authUser.id,
          item_code: this.item.Item.itemCode,
        })
        .then((res) => {
          console.log(res);
        })
        .catch((error) => {
          this.errors = error.response.data.message;
          this.$toasted.error(this.errors);
        });
      this.isLiked = true;
    },
    altImg() {
      this.item.Item.mediumImageUrls[0].imageUrl =
        "../../../../assets/images/logo_light_pink.JPG";
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
.content {
  margin: 0.5rem;
}
.item-price {
  color: red;
  margin-bottom: 0 !important;
}
.review-box {
  display: flex;
}
.review-average {
  color: orange;
  margin: 0 !important;
}
.review-count {
  color: #999;
  padding: auto 0 !important;
  margin-left: 10px;
}
.star {
  color: #ff694b;
}
.star-outline {
  color: #ff694b;
}
.item-img {
  width: 16rem !important;
  height: 16rem !important;
  object-fit: contain !important;
  margin: 0 auto;
}
a {
  color: #333 !important;
}
@media screen and (max-width: 480px) {
  .is-parent {
    padding: 0;
  }
  .item-img {
    width: 10rem !important;
    height: 10rem !important;
  }
}
</style>
