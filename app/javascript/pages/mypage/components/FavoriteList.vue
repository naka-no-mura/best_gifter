<template>
  <div class="section">
    <h2 class="title my-f-tl">お気に入り</h2>
    <div class="my-favorite-items">
      <template v-for="item in items">
        <div  class="my-favorite-item">
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
      items: [],
    };
  },
  computed: {
    ...mapGetters("users", ["authUser"])
  },
  created() {
    this.getFavoriteItems();
  },
  methods: {
    getFavoriteItems() {
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

<style scoped>
.my-f-tl {
  text-align: center;
}
.my-favorite-items {
  display: flex;
  flex-wrap: wrap;
  justify-content: center;
}
.my-favorite-item {
  width: 30%;
  margin: 0.5rem;
}
@media screen and (max-width: 959px) {
.my-favorite-items {
  display: block;
}
.my-favorite-item {
  width: 100%;
  margin: 1rem auto;
}
}
@media screen and (max-width: 480px) {
.my-favorite-items {
  display: block;
}
.my-favorite-item {
  width: 100%;
  margin: 1rem auto;
}
.section {
  padding: 0;
}
}
</style>
