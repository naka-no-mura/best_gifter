<template>
  <div class="container">
    <div class="columns">
      <MyQuestionnaire class="column is-one-third"></MyQuestionnaire>
      <FavoriteList class="column"></FavoriteList>
    </div>
  </div>
</template>

<script>
import FavoriteList from "./components/FavoriteList.vue";
import MyQuestionnaire from "./components/MyQuestionnaire.vue";

export default {
  name: "MypageIndex",
  components: {
    FavoriteList,
    MyQuestionnaire
  },
};
</script>

<style lang="scss"></style>
