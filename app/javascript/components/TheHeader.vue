<template>
  <nav
    class="navbar is-fixed-top responsive-nav"
    role="navigation"
    aria-label="main navigation"
  >
    <div class="navbar-brand">
      <p class="navbar-item">
        <img src="../../assets/images/logo_header.JPG" />
      </p>
      <a
        role="button"
        class="navbar-burger"
        v-bind:class="{ 'is-active': isActive }"
        aria-label="menu"
        aria-expanded="false"
        data-target="navbarBasicExample"
        @click="changeIsActive()"
      >
        <span aria-hidden="true"></span>
        <span aria-hidden="true"></span>
        <span aria-hidden="true"></span>
      </a>
    </div>

    <div
      id="navbarBasicExample"
      class="navbar-menu"
      v-bind:class="{ 'is-active': isActive }"
    >
      <div class="navbar-start"></div>
      <div class="navbar-end">
        <router-link to="/" class="navbar-item nav-item"
          ><b-icon class="nav-icon" icon="laptop" size="is-small"></b-icon
          ><span
            @click="
              changeIsActive();
              pageToTop();
            "
            >トップ</span
          ></router-link
        >

        <router-link to="/items" class="navbar-item nav-item"
          ><b-icon class="nav-icon" icon="magnify" size="is-small"></b-icon
          ><span
            @click="
              changeIsActive();
              pageToTop();
            "
            >検索</span
          ></router-link
        >
        <template v-if="!authUser">
          <router-link to="register" class="navbar-item nav-item"
            ><b-icon
              class="nav-icon"
              icon="account-plus-outline"
              size="is-small"
            ></b-icon
            ><span
              @click="
                changeIsActive();
                pageToTop();
              "
              >新規登録</span
            ></router-link
          >

          <router-link to="/login" class="navbar-item nav-item"
            ><b-icon class="nav-icon" icon="login" size="is-small"></b-icon
            ><span
              @click="
                changeIsActive();
                pageToTop();
              "
              >ログイン</span
            ></router-link
          >
        </template>
        <template v-else>
          <div class="navbar-item has-dropdown is-hoverable nav-item">
            <a class="navbar-link"
              ><b-icon class="nav-icon" icon="forum" size="is-small"></b-icon>
              アンケート
            </a>
            <div class="navbar-dropdown">
              <router-link
                to="/questionnaire_form"
                class="navbar-item responsive-nav-dropdown"
                ><b-icon
                  class="nav-icon"
                  icon="comment-question-outline"
                  size="is-small"
                ></b-icon
                ><span
                  @click="
                    changeIsActive();
                    pageToTop();
                  "
                  >投稿する</span
                ></router-link
              >

              <router-link
                to="/questionnaire_list"
                class="navbar-item responsive-nav-dropdown"
                ><b-icon
                  class="nav-icon"
                  icon="vote-outline"
                  size="is-small"
                ></b-icon
                ><span
                  @click="
                    changeIsActive();
                    pageToTop();
                  "
                  >投票して結果をみる</span
                ></router-link
              >
            </div>
          </div>
          <router-link
            to="/mypage"
            class="navbar-item nav-item"
            v-if="authUser"
          >
            <b-icon
              class="nav-icon"
              icon="account-outline"
              size="is-small"
            ></b-icon
            ><span
              @click="
                changeIsActive();
                pageToTop();
              "
              >マイページ</span
            ></router-link
          >
          <router-link
            to=""
            @click.native="handleLogout"
            class="nav-item navbar-item"
            ><b-icon class="nav-icon" icon="logout" size="is-small"></b-icon
            ><span
              @click="
                changeIsActive();
                pageToTop();
              "
              >ログアウト</span
            ></router-link
          >
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
      logo_img: require("../../assets/images/logo_header.JPG"),
      icon_img: require("../../assets/images/person-circle.svg"),
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
}
</style>
