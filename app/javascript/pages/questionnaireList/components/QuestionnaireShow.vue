<template>
  <div class="container">
    <!-- モーダル（ログインの有無確認） -->
    <template v-if="!authUser">
      <div
        class="modal"
        :class="{ 'is-active': isActive }"
      >
        <div class="modal-background" />
        <div class="modal-content">
          <p class="q-tl">
            アンケートに投票して結果を見てみましょう！<br>ギフト選びの参考になるかも？
          </p>
          <div class="block logo">
            <p><img src="../../../../assets/images/logo_medium_pink.JPG"></p>
          </div>
          <router-link
            to="/login"
            @click.native="pageToTop()"
          >
            <p class="q-tx">
              アカウントをお持ちの方はこちらから▼
            </p>
            <button class="button q-btn q-m-btn is-fullwidth is-rounded">
              ログインして投票する
            </button>
          </router-link><br>
          <br>
          <br>
          <p class="q-tx">
            アカウントをお持ちでない方も<br><b><big>簡単2クリック！▼</big></b>
          </p>
          <template v-if="!loginForVote">
            <button
              class="button q-btn q-m-btn is-fullwidth is-rounded"
              disabled
              @click="
                register();
                pageToTop();
              "
            >
              ① 投票用アカウントを作成して
            </button>
          </template>
          <template v-else>
            <button
              class="button q-btn q-m-btn is-fullwidth is-rounded"
              @click="register()"
            >
              ① 投票用アカウントを作成して
            </button>
          </template>
          <br>
          <template v-if="!gAccountForVote">
            <button
              class="button q-btn q-m-btn is-fullwidth is-rounded"
              disabled
              @click="login()"
            >
              ② ログインして投票する
            </button>
          </template>
          <template v-else>
            <button
              class="button q-btn q-m-btn is-fullwidth is-rounded"
              @click="
                login();
                pageToTop();
              "
            >
              ② ログインして投票する
            </button>
          </template>
        </div>
      </div>
    </template>

    <!-- アンケート情報 -->
    <div class="section q-tl">
      <h1 class="title tl-shadow">
        Vote &amp; Result
      </h1>
      <h1 class="title tl-relative">
        みんなのアンケート結果
      </h1>
      <p class="subtitle v-tl">
        みんなのアンケートがヒントになるかもしれません。<br>投票することで結果を見ることができます。
      </p>
    </div>
    <div class="q-item">
      <div class="q-item-box">
        <div class="section">
          <div class="twitter_share">
            <button
              class="button tw-btn"
              @click="twitterShare"
            >
              <b-icon
                class="tw-icon"
                icon="twitter"
                size="is-medium"
              />シェアする
            </button>
          </div>
          <p class="gift-q-tl">
            <b-icon
              icon="gift-outline"
              size="is-middium"
              class="gift-icon"
            />
            ギフトを贈りたいお相手について
          </p>
          <p>
            <b-icon
              icon="arrow-right-drop-circle-outline"
              size="is-small"
            />
            間柄：{{ questionnaire.relationship }}
          </p>
          <p>
            <b-icon
              icon="arrow-right-drop-circle-outline"
              size="is-small"
            />
            性別：{{ questionnaire.gender }}
          </p>
          <p>
            <b-icon
              icon="arrow-right-drop-circle-outline"
              size="is-small"
            />
            年齢：{{ questionnaire.age }}
          </p>
          <p>
            <b-icon
              icon="arrow-right-drop-circle-outline"
              size="is-small"
            />
            内容：{{ questionnaire.text }}
          </p>
        </div>
        <div class="answers">
          <vue-poll
            v-bind="options"
            @addvote="addVote"
          />
        </div>
      </div>
      <button
        class="button is-text back-to-list"
        @click="pushQuestionnaireList()"
      >
        みんなのアンケート結果一覧へ
      </button>
    </div>
  </div>
</template>

<script>
import axios from "../../../plugins/axios";
import { mapGetters, mapActions } from "vuex";

export default {
  name: "QuestionnaireShow",
  data() {
    return {
      isActive: true,
      gAccountForVote: false,
      loginForVote: true,
      user: {
        name: "投票用の一時的なアカウント",
        email: "",
        password: "password",
        password_confirmation: "password",
      },
      questionnaire: "",
      options: {
        question: "",
        answers: [
          {
            value: "",
            text: "",
            votes: "",
          },
          {
            value: "",
            text: "",
            votes: "",
          },
          {
            value: "",
            text: "",
            votes: "",
          },
        ],
      },
    };
  },
  computed: {
    ...mapGetters("users", ["authUser"]),
  },
  created() {
    this.getQuestionnaire();
    this.gTmpEmail();
  },
  methods: {
    getQuestionnaire() {
      this.$axios
        // .get(`http://localhost:3000/api/v1/questionnaires/${this.$route.params.id}`)
        .get(
          `https://www.best-gifter.work/api/v1/questionnaires/${this.$route.params.id}`
        )
        .then((res) => {
          this.$data.questionnaire = res.data;
          this.$data.options.answers[0].value =
            res.data.questionnaire_choices[0].id;
          this.$data.options.answers[0].text =
            res.data.questionnaire_choices[0].choice;
          this.$data.options.answers[0].votes =
            res.data.questionnaire_choices[0].answers_count;
          this.$data.options.answers[1].value =
            res.data.questionnaire_choices[1].id;
          this.$data.options.answers[1].text =
            res.data.questionnaire_choices[1].choice;
          this.$data.options.answers[1].votes =
            res.data.questionnaire_choices[1].answers_count;
          this.$data.options.answers[2].value =
            res.data.questionnaire_choices[2].id;
          this.$data.options.answers[2].text =
            res.data.questionnaire_choices[2].choice;
          this.$data.options.answers[2].votes =
            res.data.questionnaire_choices[2].answers_count;
        })
        .catch((err) => {
          console.log(err);
        });
    },
    addVote: function(obj) {
      return (
        this.$axios
          // .post("http://localhost:3000/api/v1/answers", {
          .post("https://www.best-gifter.work/api/v1/answers", {
            user_id: this.authUser.id,
            questionnaire_choice_id: obj.value,
            questionnaire_id: this.questionnaire.id,
          })
          .then((res) => {
            console.log(res);
            this.$toasted.success("アンケートに投票しました");
          })
          .catch((error) => {
            console.log(error);
            this.$toasted.error(error.response.data.message);
          })
      );
    },

    // ログイン関係
    changeIsActive() {
      this.isActive = !this.isActive;
    },
    ...mapActions("users", ["loginUserForVote", "fetchUser"]),

    gTmpEmail() {
      this.user.email =
        Math.floor(Math.random() * 100000000000000000).toString(36) +
        "@tmp.com";
    },

    register() {
      this.$axios
        // .post("http://localhost:3000/api/v1/users", { user: this.user })
        .post("https://www.best-gifter.work/api/v1/users", { user: this.user })
        .catch((error) => {
          console.log(error);
          this.errors = error.response.data.errors;
        });
      (this.gAccountForVote = true), (this.loginForVote = false);
    },

    async login() {
      const user = {
        email: this.user.email,
        password: "password",
      };
      try {
        await this.loginUserForVote(user);
        this.$toasted.success(
          "投票用アカウントでログイン（お気に入り登録とアンケート投稿は保存されません）"
        );
      } catch (error) {
        console.log(error);
      }
    },

    // Twitterシェア機能
    twitterShare() {
      //シェアする画面を設定
      var shareURL =
        "https://twitter.com/intent/tweet?text=" +
        "【こんな新郎新婦へギフトを贈りたい💐】%0a間柄：" +
        `${this.questionnaire.relationship}` +
        "%0a性別：" +
        `${this.questionnaire.gender}` +
        "%0a年齢：" +
        `${this.questionnaire.age}` +
        "%0a内容：" +
        `${this.questionnaire.text}` +
        "%0a%20%23結婚祝い%0a" +
        "%0aどのギフトが最適そうでしょうか？" +
        "%0a▼投票にご協力下さい！%0a" +
        "&url=" +
        `https://www.best-gifter.work/questionnaire_list/${this.$route.params.id}`;
      //シェア用の画面へ移行
      window.open(shareURL, "_blank");
    },

    pageToTop() {
      window.scrollTo({
        top: 0,
        behavior: "auto",
      });
    },

    pushQuestionnaireList() {
      this.$router.push({ name: "QuestionnaireListIndex" });
    },
  },
};
</script>

<style scoped>
.q-tl {
  text-align: center;
  padding-top: 5rem !important;
}
.tl-relative {
  margin-top: -4rem;
  font-size: 2.5rem !important;
}
.tl-shadow {
  font-size: 6rem;
  font-weight: bold;
  color: #ffd3d4;
  margin-top: 3rem;
}
.v-tl {
  padding-top: 3rem;
}
img {
  width: 15%;
  margin: 0 auto;
}
.logo {
  text-align: center;
}
.tw-btn {
  background-color: #1da1f2;
  color: white;
  border: 5px solid #1da1f2;
  transition: 0.3s;
  margin-bottom: 2rem;
}
.tw-btn:hover {
  border: 5px solid #1da1f2 !important;
  background-color: white;
  color: #1da1f2;
}
.tw-btn:hover .tw-icon {
  color: #1da1f2 !important;
}
.tw-icon {
  color: white;
  margin: 0 1rem 0 0.3rem !important;
  transition: 0.3s;
}
.q-btn {
  background-color: #77c7f7 !important;
  border: 5px solid #77c7f7 !important;
  transition: 0.3s;
  color: white;
  margin-top: 1rem;
}
.q-item {
  padding: 3rem 10rem;
}
.q-item-box {
  background-color: white;
  padding: 2rem;
  border-radius: 1rem;
  border: 5px solid #ffd3d4;
}
.gift-icon {
  color: #ffd3d4;
}
.gift-q-tl {
  border-bottom: 1px solid #ffd3d4;
  margin-bottom: 1rem;
}
.q-m-btn {
  width: 80% !important;
  margin: 0 auto;
}
.q-btn:hover {
  background-color: white !important;
  color: #333333;
  text-shadow: 0 0 0 #333;
}
.q-tl {
  color: white;
  text-align: center;
  font-size: 1.5rem;
  margin-bottom: 1rem;
}
.q-tx {
  color: white;
  text-align: center;
}
.ip-ver {
  display: none;
}
.sp-ver {
  display: none;
}
.back-to-list {
  margin-top: 1rem;
}
@media screen and (max-width: 959px) {
  .pc-ver {
    display: none;
  }
  .sp-ver {
    display: none;
  }
  .ip-ver {
    display: block;
  }
  .q-btn {
    margin: 0rem auto 0;
  }
  .q-icon {
    margin-left: 0.3rem !important;
  }
  .q-item {
    padding: 2rem 5rem;
  }
}
@media screen and (max-width: 480px) {
  img {
    width: 40%;
  }
  .pc-ver {
    display: none;
  }
  .ip-ver {
    display: none;
  }
  .sp-ver {
    display: block;
    margin-top: 1rem;
  }
  .q-btn {
    margin: 0 auto;
  }
  .q-icon {
    margin-left: 0.1rem !important;
  }
  .q-item {
    padding: 2rem 1rem;
  }
  .q-item-box {
    background-color: white;
    padding: 2rem;
    border-radius: 1rem;
    border: 5px solid #ffd3d4;
  }
.q-tl {
  padding-top: 3rem !important;
  width: 95%;
}
.tl-relative {
  margin-top: -2.5rem;
  font-size: 1.5rem !important;
}
.tl-shadow {
  font-size: 2.5rem;
  font-weight: bold;
  color: #ffd3d4;
  margin-top: 0rem;
}
}
</style>
