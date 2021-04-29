<template>
  <div class="tile is-parent">
    <!-- pc ver -->
    <div class="mask pc-ver">
      <a target="_blank" :href="item.Item.itemUrl">
        <button class="button i-btn is-rounded rakuten-btn">
          楽天市場へ
        </button>
      </a>
      <br />
      <template v-if="authUser">
        <button
          class="button i-btn is-rounded favorite-btn"
          @click="favorite()"
        >
          お気に入り登録
        </button>
      </template>
    </div>
    <!-- スマホ タブレット ver -->
    <div class="mask sm-tb-ver" @click="changeIsActive()"></div>
    <article class="tile is-child tile-image">
      <!-- モーダル -->
      <div class="modal i-modal" :class="{ 'is-active': isActive }">
        <div class="modal-background" @click="changeIsActive()"></div>
        <div class="modal-content" @click="changeIsActive()">
          <a target="_blank" :href="item.Item.itemUrl">
            <button class="button i-btn is-rounded rakuten-btn">
              楽天市場へ
            </button>
          </a>
          <br />
          <br />
          <br />
          <br />
          <template v-if="authUser">
            <button
              class="button i-btn is-rounded favorite-btn"
              @click="favorite()"
            >
              お気に入り登録
            </button>
          </template>
        </div>
      </div>
      <figure class="image image-box">
        <img
          :src="item.Item.mediumImageUrls[0].imageUrl"
          alt=""
          class="item-img"
          on:error="altImg()"
        />
      </figure>
      <div class="content">
        <p>
          <small>{{ sliceItemName(item.Item.itemName) }}</small>
        </p>
        <p class="item-price">
          <big>
            <b>{{ item.Item.itemPrice.toLocaleString() }}円</b>
          </big>
        </p>
        <div class="review-box">
          <small
            ><star-rating
              v-model="item.Item.reviewAverage"
              :increment="0.01"
              read-only
              :star-size="15"
              class="review-average"
          /></small>
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
    item: {
      type: Object,
      required: true,
    },
  },
  data() {
    return {
      isLiked: false,
      isActive: false,
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
          this.$toasted.success("お気に入りに登録しました");
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
    changeIsActive() {
      this.isActive = !this.isActive;
    },
  },
};
</script>
<style scope>
.i-btn {
  width: 80%;
  margin-top: 5rem;
}
.rakuten-btn {
  background-color: #bf0000 !important;
  border: 5px solid #bf0000 !important;
  transition: 0.3s;
  color: white !important;
}
.rakuten-btn:hover {
  background-color: white !important;
  color: #333333 !important;
}
.favorite-btn {
  background-color: #ffd3d4 !important;
  border: 5px solid #ffd3d4 !important;
  transition: 0.3s;
  color: #333333 !important;
}
.favorite-btn:hover {
  background-color: white !important;
  color: #333333 !important;
}
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
.item-img {
  width: 16rem !important;
  height: 16rem !important;
  object-fit: contain !important;
  margin: 0 auto;
}
a {
  color: #333 !important;
}
.sm-tb-ver {
  display: none;
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
@media screen and (max-width: 959px) {
  .pc-ver {
    display: none;
  }
  .sm-tb-ver {
    display: block;
  }
  .i-btn {
    width: 80%;
    margin-top: 0;
  }
  .i-modal {
    text-align: center;
    z-index: 101 !important;
  }
}
</style>
