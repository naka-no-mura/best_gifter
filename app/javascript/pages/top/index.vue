<template>
  <div class="container">
    <h1>Best Gifter</h1>
    <h2>Wedding</h2>
    <div class="mt-4">
      新郎新婦へ、最高のギフトを贈りたい。
    </div>
        <RakutenApiCallTopVer></RakutenApiCallTopVer>
    <RelationshipRakutenApiCall></RelationshipRakutenApiCall>
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

<style scoped></style>
