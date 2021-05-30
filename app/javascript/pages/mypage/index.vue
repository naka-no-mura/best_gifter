<template>
  <div class="container mypage">
    <div class="block">
      <p><img src="../../../assets/images/logo_medium_pink.JPG"></p>
      <p class="subtitle">
        <b><big>{{ authUser.name }}</big></b>さんのマイページ
      </p>
    </div>
    <div class="my-page-box">
      <MyQuestionnaire class="my-page-q" />
      <FavoriteList class="my-page-f" />
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
};
</script>

<style scoped>
.mypage {
  padding: 8rem 0;
}
img {
  width: 15%;
  margin: 0 auto;
}
.block {
  text-align: center;
}
.subtitle {
  margin: 1rem auto;
}
.my-page-box {
  display: flex;
}
.my-page-q {
  width: 35%;
}
.my-page-f {
  width: 65%;
}
@media screen and (max-width: 959px) {
.my-page-q {
  width: 50%;
}
.my-page-f {
  width: 50%;
}
}
@media screen and (max-width: 480px) {
img {
  width: 50%;
}
.my-page-box {
  display: block;
}
.my-page-q {
  width: 95%;
  margin: 0 auto;
}
.my-page-f {
  width: 95%;
  margin: 0 auto;
}
}
</style>
