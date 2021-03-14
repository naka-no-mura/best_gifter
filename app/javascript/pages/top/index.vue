<template>
  <div>
    <div class="top-image">
      <h1>Best Gifter<br>wedding</h1>
      <h2>新郎新婦へ、最高のギフトを贈りたい。</h2>
      <div class="container">
        <RakutenApiCallTopVer />
      </div>
    </div>
    <div class="container">
      <RelationshipRakutenApiCall />
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
  height: 48rem;
  padding-top: 6rem;
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
@media screen and (max-width: 480px) {
  .top-image {
    background-image: url("../../../assets/images/top_image.jpg");
    background-position: center;
    background-size: cover;
    text-align: left;
    height: 30rem;
    padding-top: 4rem;
  }
  h1 {
    font-size: 4rem;
    line-height: 4.5rem;
    padding: 3rem 1rem 0;
  }
  h2 {
    font-size: 1rem;
    padding: 3rem 1rem 0;
  }
}
</style>
