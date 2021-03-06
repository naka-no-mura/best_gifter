<template>
  <div class="container mypage">
    <div class="block">
    <p><img src="../../../assets/images/logo_medium_pink.JPG"></p>
    <p class="subtitle"><b><big>{{ this.authUser.name }}</big></b>さんのマイページ</p>
    </div>
    <div class="columns">
      <MyQuestionnaire class="column is-one-third"></MyQuestionnaire>
      <FavoriteList class="column"></FavoriteList>
    </div>
  </div>
</template>

<script>
import { mapGetters } from "vuex";
import FavoriteList from "./components/FavoriteList.vue";
import MyQuestionnaire from "./components/MyQuestionnaire.vue";

export default {
  name: "MypageIndex",
  components: {
    FavoriteList,
    MyQuestionnaire
  },
  computed: {
    ...mapGetters("users", ["authUser"])
  },
  method: {

  }
};
</script>

<style scoped>
.mypage {
  padding: 5rem 0;
}
img {
  width: 15%;
  margin: 0 auto;
}
.block {
  text-align: center;
}
.subtitle {
  margin: 1rem;
}
</style>
