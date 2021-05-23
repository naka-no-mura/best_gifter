<template>
  <div class="container">
  <!-- モーダル（ログインの有無確認） -->
    <template v-if="!authUser">
      <div class="modal" :class="{ 'is-active': isActive }">
        <div class="modal-background"></div>
        <div class="modal-content">
        <p class="q-tl">アンケートに投票して結果を見てみましょう！<br>ギフト選びの参考になるかも？</p>
          <div class="block logo">
            <p><img src="../../../../assets/images/logo_medium_pink.JPG"></p>
          </div>
          <router-link to="/login" @click.native="pageToTop()">
            <p class="q-tx">アカウントをお持ちの方はこちらから▼</p>
            <button class="button q-btn q-m-btn is-fullwidth is-rounded">
              ログインして投票する
            </button> </router-link
          ><br />
          <br />
          <br />
          <p class="q-tx">アカウントをお持ちでない方も<br><b><big>簡単2クリック！▼</big></b></p>
          <template v-if="!loginForVote">
            <button class="button q-btn q-m-btn is-fullwidth is-rounded" disabled @click="register(); pageToTop();">
              ① 投票用アカウントを作成して
            </button>
          </template>
          <template v-else>
            <button class="button q-btn q-m-btn is-fullwidth is-rounded" @click="register()">
              ① 投票用アカウントを作成して
            </button>
          </template>
          <br />
          <template v-if="!gAccountForVote">
            <button class="button q-btn q-m-btn is-fullwidth is-rounded" disabled @click="login()">
              ② ログインして投票する
            </button>
          </template>
          <template v-else>
            <button class="button q-btn q-m-btn is-fullwidth is-rounded" @click="login(); pageToTop();">
              ② ログインして投票する
            </button>
          </template>
        </div>
      </div>
    </template>

    <!-- アンケート情報 -->
    <div class="q-item">
    <div class="q-item-box">
    <div class="section">
      <p class="gift-q-tl">
        <b-icon
          icon="gift-outline"
          size="is-middium"
          class="gift-icon"
        /> ギフトを贈りたいお相手について
      </p>
      <p>
        <b-icon
          icon="arrow-right-drop-circle-outline"
          size="is-small"
        /> 間柄：{{ questionnaire.relationship }}
      </p>
      <p>
        <b-icon
          icon="arrow-right-drop-circle-outline"
          size="is-small"
        /> 性別：{{ questionnaire.gender }}
      </p>
      <p>
        <b-icon
          icon="arrow-right-drop-circle-outline"
          size="is-small"
        /> 年齢：{{ questionnaire.age }}
      </p>
      <p>
        <b-icon
          icon="arrow-right-drop-circle-outline"
          size="is-small"
        /> 内容：{{ questionnaire.text }}
      </p>
    </div>
    <div class="answers">
      <vue-poll
        v-bind="options"
        @addvote="addVote"
      />
    </div>
    <div class="twitter_share">
      <button class="button tw-btn" @click="twitterShare"><b-icon class="tw-icon" icon="twitter" size="is-medium"></b-icon>シェアする</button>
    </div>
    </div>
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
            value: '',
            text: '',
            votes: '',
          },
          {
            value: '',
            text: '',
            votes: '',
          },
          {
            value: '',
            text: '',
            votes: '',
          },
        ]
      }
    };
  },
  created() {
    this.getQuestionnaire();
    this.gTmpEmail();
  },
  computed: {
    ...mapGetters("users", ["authUser"]),
  },
  methods: {
    getQuestionnaire() {
      this.$axios
        .get(`http://localhost:3000/api/v1/questionnaires/${this.$route.params.id}`)
        .then((res) => {
          this.$data.questionnaire = res.data;
          this.$data.options.answers[0].value = res.data.questionnaire_choices[0].id;
          this.$data.options.answers[0].text = res.data.questionnaire_choices[0].choice;
          this.$data.options.answers[0].votes = res.data.questionnaire_choices[0].answers_count;
          this.$data.options.answers[1].value = res.data.questionnaire_choices[1].id;
          this.$data.options.answers[1].text = res.data.questionnaire_choices[1].choice;
          this.$data.options.answers[1].votes = res.data.questionnaire_choices[1].answers_count;
          this.$data.options.answers[2].value = res.data.questionnaire_choices[2].id;
          this.$data.options.answers[2].text = res.data.questionnaire_choices[2].choice;
          this.$data.options.answers[2].votes = res.data.questionnaire_choices[2].answers_count;
          // console.log(res);
          // for (let key of Object.keys(res)) {
          //   console.log(key);
          //   console.log(res[key]);
          // }
        })
        .catch((err) => {
          console.log(err);
        });
    },
    addVote: function(obj) {
      return this.$axios
        .post("http://localhost:3000/api/v1/answers", {
          user_id: this.authUser.id,
          questionnaire_choice_id: obj.value,
          questionnaire_id: this.questionnaire.id,
        })
        .then((res) => {
          console.log(res);
          this.$toasted.success('アンケートに投票しました');
        })
        .catch((error) => {
          console.log(error);
          this.$toasted.error(error.response.data.message);
        });
    },

    // ログイン関係
    changeIsActive() {
      this.isActive = !this.isActive;
    },
    ...mapActions("users", ["loginUserForVote", "fetchUser"]),

    gTmpEmail() {
      this.user.email = Math.floor(Math.random() * 100000000000000000).toString(36) + '@tmp.com'
    },

    register() {
      this.$axios
        .post("http://localhost:3000/api/v1/users", { user: this.user })
        .catch((error) => {
          console.log(error);
          this.errors = error.response.data.errors
        });
      this.gAccountForVote = true,
      this.loginForVote = false
    },

    async login() {
      const user = {
        email: this.user.email,
        password: "password",
      }
      try {
        await this.loginUserForVote(user);
        this.$toasted.success("投票用アカウントでログイン（お気に入り登録とアンケート投稿は保存されません）");
      } catch (error) {
        console.log(error);
      }
    },

    // Twitterシェア機能
    twitterShare(){
      //シェアする画面を設定
      var shareURL = 'https://twitter.com/intent/tweet?text=' + "【こんな新郎新婦へギフトを贈りたい💐】%0a間柄：" + `${this.questionnaire.relationship}` + "%0a性別：" + `${this.questionnaire.gender}` + "%0a年齢：" + `${this.questionnaire.age}` + "%0a内容：" + `${this.questionnaire.text}` + "%0a%20%23結婚祝い%0a" + "%0aどのギフトが最適そうでしょうか？" + "%0a▼投票にご協力下さい！%0a" + '&url=' + `https://www.best-gifter.work/questionnaire_list/${this.$route.params.id}`;
      //シェア用の画面へ移行
      window.open(shareURL, '_blank')
    },

    pageToTop() {
      window.scrollTo({
        top: 0,
        behavior: "auto",
      });
    },
  },
}
</script>

<style scoped>
img {
  width: 15%;
  margin: 0 auto;
}
.logo {
  text-align: center;
}
.tw-btn {
  background-color: #1DA1F2;
  color: white;
  border: 5px solid #1DA1F2;
  transition: 0.3s;
}
.tw-btn:hover {
  border: 5px solid #1DA1F2 !important;
  background-color: white;
  color: #1DA1F2;
}
.tw-btn:hover .tw-icon {
  color: #1DA1F2 !important;
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
  padding: 10rem;
}
.q-item-box {
  background-color: white;
  padding: 2rem;
  border-radius: 1rem;
  border: 5px solid #ffd3d4;
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
  padding: 7rem 1rem;
}
.q-item-box {
  background-color: white;
  padding: 2rem;
  border-radius: 1rem;
  border: 5px solid #ffd3d4;
}
}
</style>
