<template>
  <nav
    class="navbar is-fixed-top responsive-nav"
    role="navigation"
    aria-label="main navigation"
  >
    <div class="navbar-brand">
      <p>
        <router-link to="/">
          <img
            class="logo-img"
            src="../../../assets/images/logo_dark_pink.JPG"
            @click="pageToTop()"
          >
        </router-link>
      </p>
      <a
        role="button"
        class="navbar-burger"
        :class="{ 'is-active': isActive }"
        aria-label="menu"
        aria-expanded="false"
        data-target="navbarBasicExample"
        @click="changeIsActive()"
      >
        <span aria-hidden="true" />
        <span aria-hidden="true" />
        <span aria-hidden="true" />
      </a>
    </div>

    <div
      id="navbarBasicExample"
      class="navbar-menu"
      :class="{ 'is-active': isActive }"
    >
      <div class="navbar-start" />
      <div class="navbar-end">
        <router-link
          to="/"
          class="navbar-item nav-item"
          @click.native="pageToTop()"
        >
          <b-icon
            class="nav-icon"
            icon="laptop"
            size="is-small"
          /><span>トップ</span>
        </router-link>
        <router-link
          to="/items"
          class="navbar-item nav-item"
          @click.native="pageToTop()"
        >
          <b-icon
            class="nav-icon"
            icon="magnify"
            size="is-small"
          /><span>検索</span>
        </router-link>
        <template v-if="!authUser">
          <router-link
            to="register"
            class="navbar-item nav-item"
            @click.native="pageToTop()"
          >
            <b-icon
              class="nav-icon"
              icon="account-plus-outline"
              size="is-small"
            /><span @click="changeIsActive()">新規登録</span>
          </router-link>
          <router-link
            to="/login"
            class="navbar-item nav-item"
            @click.native="pageToTop()"
          >
            <b-icon
              class="nav-icon"
              icon="login"
              size="is-small"
            /><span>ログイン</span>
          </router-link>
        </template>
        <template v-else>
          <div class="navbar-item has-dropdown is-hoverable nav-item">
            <a
              class="navbar-link"
            ><b-icon
              class="nav-icon"
              icon="forum"
              size="is-small"
            />
              アンケート
            </a>
            <div class="navbar-dropdown">
              <router-link
                to="/questionnaire_form"
                class="navbar-item responsive-nav-dropdown"
                @click.native="pageToTop()"
              >
                <b-icon
                  class="nav-icon"
                  icon="comment-question-outline"
                  size="is-small"
                /><span @click="changeIsActive()">投稿する</span>
              </router-link>

              <router-link
                to="/questionnaire_list"
                class="navbar-item responsive-nav-dropdown"
                @click.native="pageToTop()"
              >
                <b-icon
                  class="nav-icon"
                  icon="vote-outline"
                  size="is-small"
                /><span @click="changeIsActive()">投票して結果をみる</span>
              </router-link>
            </div>
          </div>
          <router-link
            v-if="authUser"
            to="/mypage"
            class="navbar-item nav-item"
            @click.native="pageToTop()"
          >
            <b-icon
              class="nav-icon"
              icon="account-outline"
              size="is-small"
            /><span @click="changeIsActive()">マイページ</span>
          </router-link>
          <router-link
            to=""
            class="nav-item navbar-item"
            @click.native="
              handleLogout();
              pageToTop();
            "
          >
            <b-icon
              class="nav-icon"
              icon="logout"
              size="is-small"
            /><span
              @click="changeIsActive()"
            >ログアウト</span>
          </router-link>
        </template>
      </div>
    </div>
  </nav>
</template>

<script>
import { mapGetters, mapActions } from "vuex";
export default {
  name: "TheHeader",
  data() {
    return {
      title: "Best Gifter",
      logo_img: require("../../../assets/images/logo_header.JPG"),
      icon_img: require("../../../assets/images/person-circle.svg"),
      isActive: false,
    };
  },
  computed: {
    ...mapGetters("users", ["authUser"]),
  },
  methods: {
    ...mapActions("users", ["logoutUser"]),
    async handleLogout() {
      if (confirm("ログアウトしますか？"))
        try {
          this.logoutUser();
          this.$router.push({ name: "TopIndex" });
          this.$toasted.success("ログアウトしました");
        } catch (error) {
          console.log(error);
        }
    },
    changeIsActive() {
      this.isActive = !this.isActive;
    },
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
.logo-img {
  width: 80px;
  height: 80px;
  margin: 0.5rem 1rem;
}
.button {
  background-color: #ffd3d4;
  border: 5px solid #ffd3d4;
  transition: 0.3s;
}
.button:hover {
  background-color: white;
  border: 5px solid #ffd3d4;
}
.nav-item {
  padding: 0 2rem;
}
.nav-icon {
  padding-right: 1rem;
}
.navbar-link {
  padding: 0 2rem;
}
@media screen and (max-width: 959px) {
  .navbar {
    min-height: 4rem;
  }
  .navbar-brand {
    min-height: 4rem;
    line-height: 4;
  }
  .navbar-item {
    line-height: 4;
    padding: 0 0.5rem;
  }
  .navbar-burger {
    height: 4rem;
  }
  .nav-item {
    padding: 0.25rem 2rem;
  }
  .responsive-nav-dropdown {
    margin-left: 4rem;
  }
  .logo-tx {
    font-size: 0.8rem;
  }
  .logo-img {
    width: 50px;
    height: 50px;
    margin: 0.5rem 0.5rem 0 0.5rem;
  }
}

@media screen and (max-width: 480px) {
  .navbar {
    min-height: 2rem;
  }
  .navbar-brand {
    min-height: 2rem;
    line-height: 2;
  }
  .navbar-item {
    line-height: 2;
    padding: 0 0.5rem;
  }
  .navbar-burger {
    height: 2rem;
  }
  .nav-item {
    padding: 0.25rem 2rem;
  }
  .responsive-nav-dropdown {
    margin-left: 2rem;
  }
  .logo-tx {
    font-size: 0.8rem;
  }
  .logo-img {
    width: 30px;
    height: 30px;
    margin: 0.2rem 0.5rem 0 0.5rem;
  }
}
</style>
