<template>
  <div>
    <div>
      <RakutenApiCall></RakutenApiCall>
      <RelationshipRakutenApiCall></RelationshipRakutenApiCall>
      <RakutenApiResultList :items="items"></RakutenApiResultList>
    </div>
  </div>
</template>

<script>
import RakutenApiCall from './components/RakutenApiCall.vue';
import RelationshipRakutenApiCall from './components/RelationshipRakutenApiCall.vue';
import RakutenApiResultList from './components/RakutenApiResultList.vue';
import { mapGetters } from 'vuex';

  export default {
  name: "ItemIndex",
  components: {
    RakutenApiCall,
    RelationshipRakutenApiCall,
    RakutenApiResultList
  },
  computed: {
    ...mapGetters(['items'])
  },
  };
</script>

<style scoped>
</style>
