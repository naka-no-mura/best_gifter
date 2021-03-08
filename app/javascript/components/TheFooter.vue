<template>
  <footer class="footer">
    <div class="content has-text-centered">
      <p>
        <span>&copy; {{ copyText }}</span>
        <router-link to="/"
          ><span @click="pageToTop()" class="f-item">
            <strong> Best Gifter</strong>
          </span></router-link
        >
        <router-link to="/terms"
          ><span @click="pageToTop()" class="f-item">
            利用規約
          </span></router-link
        >
        <router-link to="/privacy_policys"
          ><span @click="pageToTop()" class="f-item">
            プライバシーポリシー
          </span></router-link
        >
        <a href="https://twitter.com/Best_Gifter" target="_blank"
          ><span class="f-item">
            <b-icon icon="twitter" size="is-middle"></b-icon></span
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

  computed: {
    thisYear() {
      return new Date().getFullYear()
    },
    copyText() {
      if (this.startYear === this.thisYear) {
        return `${this.thisYear}`
      }
      return `${this.startYear} - ${this.thisYear}`
    }
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
.f-item {
  padding: 0.8rem;
  border-radius: 5px;
}
.f-item:hover {
  background-color: #f5f5f5
}
</style>
