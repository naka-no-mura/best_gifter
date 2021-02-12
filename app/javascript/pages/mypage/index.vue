<template>
  <div class="container">
    <div class="columns">
      <FavoriteList class="column"></FavoriteList>
    </div>
  </div>
</template>

<script>
import FavoriteList from "./components/FavoriteList.vue";

export default {
  name: "MypageIndex",
  components: {
    FavoriteList,
  },
};
</script>

<style lang="scss"></style>
