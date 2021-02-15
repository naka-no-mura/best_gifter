<template>
<div class="container">
<div class="block">
<p><img src="../../../assets/images/logo_medium_pink.JPG"></p>
</div>
<div class="columns">
  <div class="column">
<div class="section">
  <div id="register-form">
    <h1 class="title">
      新規登録
    </h1>
    <b-field label="ユーザー名" 
        message="（例）山田花子">
      <b-input
        v-model="user.name"
        type="text"
      ></b-input>
    </b-field>
    <b-field label="メールアドレス" message="（例）example@example.com">
      <b-input
        v-model="user.email"
        type="email"
      /></b-input>
    </b-field>
    <b-field label="パスワード" message="（例）password">
      <b-input
        v-model="user.password"
        type="password"
      /></b-input>
    </b-field>
    <b-field label="パスワード（確認）" message="（例）password">
      <b-input
        v-model="user.password_confirmation"
        type="password"
      /></b-input>
    </b-field>
    <b-button class="register" type="submit" @click="register">
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

<style scoped>
img {
  width: 15%;
  margin: 0 auto;
}
.block {
  text-align: center;
}
.register {
  background-color: #ffd3d4;
  border: 5px solid #ffd3d4;
  transition: 0.3s ;
}
.register:hover {
  background-color: white;
  border: 5px solid #ffd3d4;
}
</style>
