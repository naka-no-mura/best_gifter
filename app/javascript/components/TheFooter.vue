<template>
  <footer class="footer">
    <div class="content has-text-centered">
      <p>
        <router-link to="/"
          ><button class="button is-text copyright" @click="pageToTop()">
            &copy; 2021<strong> Best Gifter</strong>
          </button></router-link
        >
        <router-link to="/terms"
          ><button class="button is-text" @click="pageToTop()">
            利用規約
          </button></router-link
        >
        <router-link to="/privacy_policys"
          ><button class="button is-text" @click="pageToTop()">
            プライバシーポリシー
          </button></router-link
        >
        <a href="https://twitter.com/Best_Gifter" target="_blank"
          ><button class="button is-text">
            <b-icon icon="twitter" size="is-middle"></b-icon></button
        ></a>
      </p>
    </div>
  </footer>
</template>

<script>
export default {
  name: "TheFooter",
  data() {
    return {
      startYear: 2021,
    };
  },
  methods: {
    pageToTop() {
      window.scrollTo({
        top: 0,
        behavior: "auto",
      });
    },
  },
};
</script>

<style scoped>
.copyright {
  padding: 1rem 2rem;
}
</style>
