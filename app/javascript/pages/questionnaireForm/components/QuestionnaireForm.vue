<template>
  <div>
    <div class="section q-box">
      <p class="title q-tl">アンケート投稿</p>
      <p class="subtitle q-tl">新郎新婦へ贈るギフトをいくつか考えたが一つに絞れない…とお困りのあなたに。<br>
      アンケートを投稿することでギフト選びの手助けとなるかもしれません</p>
      <ValidationObserver v-slot="{ handleSubmit }">
        <form class="section">
          <ValidationProvider rules="required" v-slot="{ errors }">
            <label for="relationship" class="subtitle"
              >ギフトを贈りたい方との間柄</label
            >
            <span class="flash-message">{{ errors[0] }}</span>
            <b-input
              id="relationship"
              v-model="questionnaire.relationship"
              type="text"
              maxlength="30"
              placeholder="（例）高校時代の同級生"
            ></b-input>
          </ValidationProvider>
          <ValidationProvider rules="required" v-slot="{ errors }">
            <label for="gender" class="subtitle"
              >ギフトを贈りたい方の性別</label
            >
            <span class="flash-message">{{ errors[0] }}</span>
            <b-select
              id="gender"
              class="gender-select"
              placeholder="選択してください"
              v-model="questionnaire.gender"
            >
              <option value="男性" v-model="questionnaire.gender">男性</option>
              <option value="女性" v-model="questionnaire.gender"
                >女性</option
              ></b-select
            >
          </ValidationProvider>
          <ValidationProvider rules="required" v-slot="{ errors }">
            <label for="age" class="subtitle">ギフトを贈りたい方の年齢</label>
            <span class="flash-message">{{ errors[0] }}</span>
            <b-input
              id="age"
              v-model="questionnaire.age"
              maxlength="10"
              placeholder="（例）25歳（定かではない場合はおおよそでも構いません）"
            ></b-input>
          </ValidationProvider>
          <ValidationProvider rules="required" v-slot="{ errors }">
            <label for="content" class="subtitle">投稿内容</label>
            <span class="flash-message">{{ errors[0] }}</span>
            <b-input
              id="content"
              maxlength="200"
              type="textarea"
              v-model="questionnaire.text"
              placeholder="（例）高校時代からの仲で社会人になっても頻繁に飲みにいく関係です"
            ></b-input>
          </ValidationProvider>
          <ValidationProvider rules="required" v-slot="{ errors }">
            <label for="choice-1" class="subtitle">1つ目 必須</label>
            <span class="flash-message">{{ errors[0] }}</span>
            <b-input
              id="choice-1"
              v-model="questionnaire.choice_first"
              maxlength="30"
              placeholder="（例）カタログギフト"
            ></b-input>
          </ValidationProvider>
          <ValidationProvider rules="required" v-slot="{ errors }">
            <label for="choice-2" class="subtitle">2つ目 必須</label>
            <span class="flash-message">{{ errors[0] }}</span>
            <b-input
              id="choice-2"
              v-model="questionnaire.choice_second"
              maxlength="30"
              placeholder="（例）温泉旅行チケット"
            ></b-input>
          </ValidationProvider>
          <label for="choice-3" class="subtitle">3つ目</label>
          <b-input
            id="choice-3"
            v-model="questionnaire.choice_third"
            maxlength="30"
            placeholder="（例）お掃除ロボット"
          ></b-input>
          <b-button
            @click="handleSubmit(createQuestionnaire)"
            class="button q-btn"
          >
            投稿する
          </b-button>
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
      },
      form: {},
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
          choice: choice_third || "結果だけ閲覧する",
        });
      };

      const choiceAll = async function() {
        await choice1();
        await choice2();
        await choice3();
      };
      choiceAll()
        .then((res) =>
          this.$toasted.show(
            "投稿完了しました。投票結果はマイページからいつでも確認できます。"
          )
        )
        .catch((err) =>
          this.$toasted.show(
            "入力漏れがあります。必須項目をすべて入力して下さい。"
          )
        );
    },
    pushQuestionnaireList() {
      this.$router.push("/questionnaire_list");
    },
  },
};
</script>

<style lang="scss">
.q-btn {
  background-color: #ffd3d4 !important;
  border: 5px solid #ffd3d4 !important;
  transition: 0.3s;
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
}
</style>
