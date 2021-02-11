<template>
  <div class="card">
      <a target="_blank" :href="item.url">
        <div class="card-image">
          <figure class="image">
            <img :src="item.image" />
          </figure>
        </div>
      </a>
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
        <p @click="unFavorite()"><b-icon icon="heart-outline" size="is-medium"></b-icon></p>
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
    },
  }
}
</script>

<style lang="scss">
</style>