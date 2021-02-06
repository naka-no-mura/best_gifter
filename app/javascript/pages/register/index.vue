<template>
  <div id="register-form">
    <div>
      ユーザー登録
    </div>
    <div>
      <label for="name">ユーザー名</label>
      <input
        id="name"
        v-model="user.name"
        type="text"
        placeholder="username"
      >
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
    <div>
      <label for="password_confirmation">パスワード（確認）</label>
      <input
        id="password_confirmation"
        v-model="user.password_confirmation"
        type="password"
        placeholder="password"
      >
    </div>
    <button
      type="submit"
      @click="register"
    >
      登録
    </button>
  </div>
</template>

<script>
export default {
  name: "RegisterIndex",
  data() {
    return {
      user: {
        name: '',
        email: '',
        password: '',
        password_confirmation: '',
      }
    }
  },
  methods: {
    register() {
      this.$axios.post('/v1/users', { user: this.user })
        .then(res => {
          this.$router.push({ name: 'LoginIndex' })
        })
        .catch(err => {
          console.log(err)
        })
    }
  }
}
</script>

<style scoped>
</style>