<template>
  <div class="section">
    <h2 class="title">お気に入り</h2>
    <button @click="favoriteItem()">お気に入りとってくる</button>
    <div class="columns is-multiline">
      <template v-for="item in items">
        <div class="column is-2">
          <FavoriteItem :key="item.id" :item="item" />
        </div>
      </template>
    </div>
  </div>
</template>

<script>
import { mapGetters } from "vuex";
import axios from "../../../plugins/axios";
import FavoriteItem from "./FavoriteItem";
export default {
  name: "FavoriteList",
  components: {
    FavoriteItem,
  },
  data() {
    return {
      items: []
    };
  },
  computed: {
    ...mapGetters("users", ["authUser"])
  },
  methods: {
    favoriteItem() {
      return this.$axios.get('/v1/items/favorites', {
        params: {
          user_id: this.authUser.id
        }
      })
      .then(res => {
        this.$data.items = res.data;
      })
      .catch(err => {
        console.log(err)
      })
    }
  }
};
</script>

<style lang="scss"></style>
