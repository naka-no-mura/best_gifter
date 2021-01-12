<template>
  <div>
    <div>
      <RakutenApiCall></RakutenApiCall>
      <RakutenApiResultList :items="items"></RakutenApiResultList>
    </div>
  </div>
</template>

<script>
import RakutenApiCall from './components/RakutenApiCall.vue';
import RakutenApiResultList from './components/RakutenApiResultList.vue';
import { mapGetters } from 'vuex';

  export default {
  name: "ItemIndex",
  components: {
    RakutenApiCall,
    RakutenApiResultList
  },
  computed: {
    ...mapGetters(['items'])
  },
  };
</script>

<style scoped>
</style>
