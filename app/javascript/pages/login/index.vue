<template>
  <div class="container">
    <div class="section">
      <h1 class="title">
        ログイン
      </h1>
      <b-field label="メールアドレス">
        <b-input
          v-model="user.email"
          type="email"
          placeholder="test@example.com"
        ></b-input>
      </b-field>
      <b-field label="パスワード">
        <b-input
          v-model="user.password"
          type="password"
          placeholder="password"
        ></b-input>
      </b-field>
      <b-button type="submit" @click="login">
        ログイン
      </b-button>
      <b-button type="submit" @click="login">
        ゲストログイン
      </b-button>
    </div>
  </div>
</template>

<script>
import { mapActions } from "vuex";
export default {
  name: "LoginIndex",
  data() {
    return {
      user: {
        email: "",
        password: "",
      },
    };
  },
  methods: {
    ...mapActions("users", ["loginUser", "fetchUser"]),
    async login() {
      try {
        await this.loginUser(this.user);
        this.$router.push({ name: "ItemIndex" });
      } catch (error) {
        console.log(error);
      }
    },
  },
};
</script>

<style scoped></style>
