<template>
<div class="container register-page">
<div class="block register-logo">
<p><img src="../../../assets/images/logo_medium_pink.JPG"></p>
</div>
<div class="columns">
  <div class="column">
    <div class="section">
      <h1 class="title">新規登録</h1>
      <div class="block merit">
          <h2 class="subtitle">検索した商品を<b><big>お気に入り登録</big></b>できるようになります。</h2>
          <p>検索だけであれば新規登録せずにご利用頂けます。</p>
      </div>
      <div class="block merit">
        <h2 class="subtitle"><b><big>アンケート機能</big></b>がご利用できるようになります。</h2>
        <p>投稿したり、他のユーザーのアンケートに投票して結果を参考できるようになるます。</p>
      </div>
    </div>
  </div>
  <div class="column">
<div class="section">
  <div id="register-form">
    <b-field label="ニックネーム"
        message="（例）ギフター">
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
        password-reveal
      /></b-input>
    </b-field>
    <b-field label="パスワード（確認）" message="（例）password">
      <b-input
        v-model="user.password_confirmation"
        type="password"
        password-reveal
      /></b-input>
    </b-field>
    <b-button class="register" type="submit" @click="register">
      登録（無料）
    </b-button>
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
.register-page {
  padding-top: 5rem;
}
.register-logo {
  text-align: center;
}
.merit {
  padding: 2rem;
  border: 5px solid #ffd3d4;
  border-radius: 15px;
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
