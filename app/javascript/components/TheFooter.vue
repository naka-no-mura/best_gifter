<template>
  <footer class="footer">
    <div class="content has-text-centered">
      <p class="f-items" /><p class="f-item">
        <span>&copy; {{ copyText }}</span>
        <router-link
          to="/"
        >
          <span @click="pageToTop()">
            <strong> Best Gifter</strong>
          </span>
        </router-link>
      </p>
      <p class="f-item">
        <router-link
          to="/terms"
        >
          <span
            id="terms"
            @click="pageToTop()"
          >
            利用規約
          </span>
        </router-link>
      </p>
      <p class="f-item">
        <router-link
          to="/privacy_policys"
        >
          <span
            id="privacy_policys"
            @click="pageToTop()"
          >
            プライバシーポリシー
          </span>
        </router-link>
      </p>
      <p class="f-item">
        <a
          href="https://twitter.com/Best_Gifter"
          target="_blank"
        ><span>
          <b-icon
            id="twitter"
            icon="twitter"
            size="is-middle"
          /></span></a>
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
  display: inline;
}
.f-item:hover {
  background-color: #f5f5f5
}
.f-items {
  display: flex;
}
@media screen and (max-width: 480px) {
.f-item {
  display: block;
  padding: 0;
}
}
</style>
