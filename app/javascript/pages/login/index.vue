<template>
  <div id="login-form">
    <div>
      ログイン
    </div>
    <div>
      <label for="email">メールアドレス</label>
      <input
        id="email"
        v-model="user.email"
        type="email"
        placeholder="test@example.com"
      >
    </div>
    <div>
      <label for="password">パスワード</label>
      <input
        id="password"
        v-model="user.password"
        type="password"
        placeholder="password"
      >
    </div>
    <button
      type="submit"
      @click="login"
    >
      ログイン
    </button>
  </div>
</template>

<script>
import { mapActions } from "vuex"
export default {
  name: "LoginIndex",
  data() {
    return {
      user: {
        email: "",
        password: "",
      }
    }
  },
  methods: {
    ...mapActions("users", [
      "loginUser",
      "fetchUser",
    ]),
    async login() {
      try {
        await this.loginUser(this.user);
        this.$router.push({ name: 'ItemIndex' })
      } catch (error) {
        console.log(error);
      }
    }
  }
}
</script>

<style scoped>
</style>
