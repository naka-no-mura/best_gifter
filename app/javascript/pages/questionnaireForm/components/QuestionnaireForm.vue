<template>
  <div class="inner-box">
    <div class="section q-box">
      <h1 class="title tl-shadow">
        Questionnaire
      </h1>
      <h1 class="title tl-relative">
        アンケート投稿
      </h1>
      <p class="subtitle q-tl">
        新郎新婦へ贈るギフトをいくつか考えたが一つに絞れない…とお困りのあなたに<br>
        アンケートを投稿することでギフト選びの手助けとなるかもしれません
      </p>
      <ValidationObserver v-slot="{ handleSubmit }">
        <form class="section">
          <ValidationProvider
            v-slot="{ errors }"
            rules="required"
          >
            <b-field
              label="ギフトを贈りたい方との間柄"
              message="（例）高校時代の同級生"
              class="tx-box"
            >
              <b-input
                id="q-relatinoship"
                v-model="questionnaire.relationship"
                class="tx-box"
                type="text"
                maxlength="30"
              />
            </b-field>
            <span class="flash-message">{{ errors[0] }}</span><br>
          </ValidationProvider>
          <ValidationProvider
            v-slot="{ errors }"
            rules="required"
          >
            <b-field
              label="ギフトを贈りたい方の性別"
              message="選択してください"
              class="tx-box"
            >
              <b-select
                id="q-gender"
                v-model="questionnaire.gender"
                class="gender-select"
              >
                <option
                  :v-model="questionnaire.gender"
                  value="男性"
                >
                  男性
                </option>
                <option
                  :v-model="questionnaire.gender"
                  value="女性"
                >
                  女性
                </option>
              </b-select>
            </b-field>
            <span class="flash-message">{{ errors[0] }}</span><br>
          </ValidationProvider>
          <ValidationProvider
            v-slot="{ errors }"
            rules="required"
          >
            <b-field
              label="ギフトを贈りたい方の年齢"
              message="（例）25歳（定かではない場合はおおよそでも構いません）"
              class="tx-box"
            >
              <b-input
                id="q-age"
                v-model="questionnaire.age"
                maxlength="10"
              />
            </b-field>
            <span class="flash-message">{{ errors[0] }}</span><br>
          </ValidationProvider>
          <ValidationProvider
            v-slot="{ errors }"
            rules="required"
          >
            <b-field
              label="投稿内容"
              message="（例）高校時代からの仲で社会人になっても頻繁に飲みにいく関係です"
              class="tx-box"
            >
              <b-input
                id="q-text"
                v-model="questionnaire.text"
                maxlength="140"
                type="textarea"
              />
            </b-field>
            <span class="flash-message">{{ errors[0] }}</span><br>
          </ValidationProvider>
          <ValidationProvider
            v-slot="{ errors }"
            rules="required"
          >
            <b-field
              label="1つ目 必須"
              message="（例）1万円のワイン"
              class="tx-box"
            >
              <b-input
                id="q-first-choice"
                v-model="questionnaire.choice_first"
                maxlength="30"
              />
            </b-field>
            <span class="flash-message">{{ errors[0] }}</span><br>
          </ValidationProvider>
          <ValidationProvider
            v-slot="{ errors }"
            rules="required"
          >
            <b-field
              label="2つ目 必須"
              message="（例）温泉旅行ペアチケット"
              class="tx-box"
            >
              <b-input
                id="q-second-choice"
                v-model="questionnaire.choice_second"
                maxlength="30"
              />
            </b-field>
            <span class="flash-message">{{ errors[0] }}</span><br>
          </ValidationProvider>
          <b-field
            label="3つ目 任意"
            message="（例）友人3人で1万円ずつ出してお掃除ロボット／ただし、何も入力しなければ「結果だけ見る」という選択肢が追加されます。"
            class="tx-box"
          >
            <b-input
              id="q-third-choice"
              v-model="questionnaire.choice_third"
              maxlength="30"
            />
          </b-field>
          <b-button
            id="q-post"
            class="button q-btn"
            expanded
            :disabled="isPush"
            @click="handleSubmit(createQuestionnaire)"
          >
            投稿する
          </b-button>
          <p style="text-align: center">
            <small>必須項目を入力すると投稿できます</small>
          </p>
          <b-button
            id="q-post"
            class="button q-btn"
            expanded
            :disabled="isPushToList"
            @click="pushQuestionnaireList(); pageToTop();"
          >
            投稿したアンケートを確認する
          </b-button>
          <p style="text-align: center">
            <small>Twitterでシェアしてみましょう！</small>
          </p>
        </form>
      </ValidationObserver>
    </div>
  </div>
</template>

<script>
import axios from "../../../plugins/axios";
import { mapGetters } from "vuex";
export default {
  name: "QuestionnaireForm",
  data() {
    return {
      questionnaire: {
        relationship: "",
        gender: "",
        age: "",
        text: "",
        choice_first: "",
        choice_second: "",
        choice_third: "",
        id: "",
      },
      form: {},
      isPush : false,
      isPushToList : true,
    };
  },
  computed: {
    ...mapGetters("users", ["authUser"]),
  },
  methods: {
    async createQuestionnaire() {
      const createQuestionnaireResponse = await this.$axios.post(
        "/v1/questionnaires",
        {
          relationship: this.questionnaire.relationship,
          gender: this.questionnaire.gender,
          age: this.questionnaire.age,
          text: this.questionnaire.text,
          user_id: this.authUser.id,
        }
      );
      const response_questionnaire_id = createQuestionnaireResponse.data.id;
      this.questionnaire.id = createQuestionnaireResponse.data.id;
      const choice_first = this.questionnaire.choice_first;
      const choice_second = this.questionnaire.choice_second;
      const choice_third = this.questionnaire.choice_third;

      const choice1 = async function() {
        await axios.post("/v1/questionnaire_choices", {
          questionnaire_id: response_questionnaire_id,
          choice: choice_first,
        });
      };

      const choice2 = async function() {
        await axios.post("/v1/questionnaire_choices", {
          questionnaire_id: response_questionnaire_id,
          choice: choice_second,
        });
      };

      const choice3 = async function() {
        axios.post("/v1/questionnaire_choices", {
          questionnaire_id: response_questionnaire_id,
          choice: choice_third || "結果だけ見る",
        });
      };

      const choiceAll = async function() {
        await choice1();
        await choice2();
        await choice3();
      };
      choiceAll()
        .then((res) =>
          this.$toasted.success('アンケートを投稿しました。結果はマイページからいつでも確認できます。'),
          this.isPush = true,
          this.isPushToList = false
        )
        .catch((err) =>
          this.$toasted.error(err.response.data.message)
        );
    },
    pushQuestionnaireList() {
      this.$router.push(`/questionnaire_list/${this.questionnaire.id}`);
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
.q-btn {
  background-color: #ffd3d4 !important;
  border: 5px solid #ffd3d4 !important;
  transition: 0.3s;
  margin-top: 3.5rem;
}
.q-btn:hover {
  background-color: white !important;
  border: 5px solid #ffd3d4 !important;
}
.gender-select {
  margin-bottom: 1rem;
}
.flash-message {
  color: red;
}
.q-box {
  width: 60%;
  margin: 0 auto;
}
.q-tl {
  text-align: center;
  padding-top: 3rem;
}
.tx-box {
  margin-top: 2em !important;
}
.tl-relative {
  margin-top: -4rem;
  font-size: 2.5rem !important;
  text-align: center;
}
.tl-shadow {
  font-size: 5rem;
  font-weight: bold;
  color: #ffd3d4;
  margin-top: 3rem;
  text-align: center;
}
@media screen and (max-width: 959px) {
.q-box {
  width: 100%;
  padding-top: 5rem;
}
.tl-shadow {
  margin-top: 0;
  padding-top: 3rem;
}
}

@media screen and (max-width: 480px) {
.tl-relative {
  margin-top: -2.5rem;
  font-size: 1.5rem !important;
}
.tl-shadow {
  font-size: 2.5rem;
  margin-top: 0rem;
}
.q-box {
  width: 95%;
  padding: 0rem;
  text-align: center;
}
.section {
  padding: 1rem;
}
}
</style>
