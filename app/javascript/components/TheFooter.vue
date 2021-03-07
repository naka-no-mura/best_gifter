<template>
<footer class="footer">
  <div class="content has-text-centered">
    <p>
      &copy; {{ copyText }} 2001<strong>Best Gifter</strong>
      <router-link to="/terms">利用規約</router-link>
      <a href="http://opensource.org/licenses/mit-license.php"></a>. The website content
      is licensed <a href="http://creativecommons.org/licenses/by-nc-sa/4.0/">CC BY NC SA 4.0</a>.
    </p>
  </div>
  </footer>
</template>

<script>
export default {
  name: "TheFooter",
  data() {
    return {
      startYear: 2021
    }
  }
}
</script>

<style scoped>
</style>
