<template>
  <footer class="footer">
    <div class="content has-text-centered">
      <p>
        &copy; {{ copyText }} 2001<strong>Best Gifter</strong>
        <router-link to="/terms"
          ><span @click="pageToTop()">利用規約</span></router-link
        >
        <router-link to="/privacy_policys"
          ><span @click="pageToTop()">プライバシーポリシー</span></router-link
        >.
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

<style scoped></style>
