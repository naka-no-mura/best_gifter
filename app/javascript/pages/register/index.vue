<template>
<div class="container">
<div class="columns">
  <div class="column">
<div class="section">
  <div id="register-form">
    <h1 class="title">
      新規登録
    </h1>
    <b-field label="ユーザー名">
      <b-input
        v-model="user.name"
        type="text"
        placeholder="ベストギフター"
      ></b-input>
    </b-field>
    <b-field label="メールアドレス">
      <b-input
        v-model="user.email"
        type="email"
        placeholder="test@example.com"
      /></b-input>
    </b-field>
    <b-field label="パスワード">
      <b-input
        v-model="user.password"
        type="password"
        placeholder="password"
      /></b-input>
    </b-field>
    <b-field label="パスワード（確認）">
      <b-input
        v-model="user.password_confirmation"
        type="password"
        placeholder="password"
      /></b-input>
    </b-field>
    <b-button type="submit" @click="register">
      登録（無料）
    </b-button>
  </div>
  </div>
  </div>
  <div class="column">
    <div class="section">
      <div class="block">
    <h1 class="title">新規登録のメリット</h1>
    <b-icon icon="check-circle-outline" size="is-medium"></b-icon>
    <h2 class="subtitle">検索した商品をお気に入りに登録できるようになります。</h2>
    <p>検索だけであれば新規登録せずにご利用頂けます。</p>
    </div>
    <div class="block">
    <b-icon icon="check-circle-outline" size="is-medium"></b-icon>
    <h2 class="subtitle">アンケート投稿機能がご利用できるようになります。</h2>
    <p>アンケートの閲覧だけであれば新規登録せずにご利用頂けます。</p>
    </div>
    </div>
  </div>
  </div>
  </div>
</template>

<script>
export default {
  name: "RegisterIndex",
  data() {
    return {
      user: {
        name: "",
        email: "",
        password: "",
        password_confirmation: "",
      },
    };
  },
  methods: {
    register() {
      this.$axios
        .post("/v1/users", { user: this.user })
        .then((res) => {
          this.$router.push({ name: "LoginIndex" });
        })
        .catch((err) => {
          console.log(err);
        });
    },
  },
};
</script>

<style scoped></style>
