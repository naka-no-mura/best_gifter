<template>
  <div>
    <div class="input-group">
      <input v-model="keyword" placeholder="キーワードで検索">
      <button type="submit" @click="exec">検索</button></span>
    </div>
    <div>
      <RakutenApiResultList :items="items"></RakutenApiResultList>
    </div>
  </div>
</template>

<script>
import RakutenApiResultList from './components/RakutenApiResultList.vue'

  export default {
  name: "ItemsIndex",
  components: {
    RakutenApiResultList
  },
    data() {
      return{
        items: [],
        keyword: '',
      }
    },
    methods: {
      exec() {
        this.$axios.get('/v1/rakuten_searches/search',{
          params: {
            keyword: this.keyword,
          },
        })
        .then(response => {
          this.items = response.data;
        })
      }
    }
  };
</script>

<style scoped>
</style>
