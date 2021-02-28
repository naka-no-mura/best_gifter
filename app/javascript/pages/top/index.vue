<template>
  <div>
    <div class="top-image">
    <h1>Best Gifter<br>wedding</h1>
    <h2>新郎新婦へ、最高のギフトを贈りたい。</h2>
      <div class="container">
        <RakutenApiCallTopVer></RakutenApiCallTopVer>
      </div>
    </div>
    <div class="container">
      <RelationshipRakutenApiCall></RelationshipRakutenApiCall>
    </div>
  </div>
</template>

<script>
import RakutenApiCallTopVer from "./components/RakutenApiCallTopVer.vue";
import RelationshipRakutenApiCall from "./components/RelationshipRakutenApiCall.vue";
export default {
  name: "TopIndex",
  components: {
    RakutenApiCallTopVer,
    RelationshipRakutenApiCall,
  },
};
</script>

<style scoped>
.top-image {
  background-image: url("../../../assets/images/top_image.jpg");
  background-position: center;
  background-size: cover;
  text-align: center;
  height: 45rem;
}
h1 {
  font-size: 9rem;
  line-height: 7rem;
  color: white;
  padding-top: 3rem;
  text-shadow: 0 0 1rem #333;
}
h2 {
  font-size: 2rem;
  color: white;
  padding-top: 3rem;
  text-shadow: 0 0 1rem #333;
}
</style>
