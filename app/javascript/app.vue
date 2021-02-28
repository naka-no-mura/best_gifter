<template>
  <div class="inner-box">
    <TheHeader />
    <router-view />
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

<style lang="scss">
.inner-box {
  background-color: #fff9ff;
}
</style>
