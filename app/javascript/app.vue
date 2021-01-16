<template>
  <div>
    <TheHeader />
    <router-view class="container" />
    <TheFooter />
  </div>
</template>

<script>
  import TheHeader from 'components/TheHeader.vue'
  import TheFooter from 'components/TheFooter.vue'

  export default {
    components: {
      TheHeader,
      TheFooter,
    }
  };
</script>

<style scoped>
</style>
