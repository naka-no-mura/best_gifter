<template>
  <div class="inner-box">
    <TheHeader />
    <router-view />
    <TheFooter />
    <div class="Page-Btn" @click="scrollTop">
    <b-icon
                  class="scroll-top"
                  icon="chevron-up-circle-outline"
                  size="is-large"
                ></b-icon
                >
  </div>
  </div>
</template>

<script>
  import TheHeader from 'components/TheHeader.vue'
  import TheFooter from 'components/TheFooter.vue'

  export default {
    components: {
      TheHeader,
      TheFooter,
    },
    methods: {
      scrollTop() {
      window.scrollTo({
        top: 0,
        behavior: "smooth"
      });
      }
    }
  };
</script>

<style scoped>
.Page-Btn{
  position: fixed;
  right: 14px;
  bottom: 14px;
  text-align: center;
  border-radius: 50%;
  background: #ffd3d4;
  color: #666666;
  z-index: 100;
}
</style>
