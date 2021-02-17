<template>
  <div>
    <div class="section">
      <p class="title">アンケート投稿</p>
      <div class="section">
        <b-field label="ギフトを贈りたい方との間柄">
          <b-input v-model="questionnaire.relationship"></b-input>
        </b-field>
        <b-field label="ギフトを贈りたい方の性別">
          <b-input v-model="questionnaire.gender"></b-input>
        </b-field>
        <b-field label="ギフトを贈りたい方の年齢">
          <b-input v-model="questionnaire.age"></b-input>
        </b-field>
        <b-field label="投稿内容">
          <b-input
            maxlength="200"
            type="textarea"
            v-model="questionnaire.text"
          ></b-input>
        </b-field>
        <b-field label="1つ目 必須">
          <b-input v-model="questionnaire.choice_first"></b-input>
        </b-field>
        <b-field label="2つ目 必須">
          <b-input v-model="questionnaire.choice_second"></b-input>
        </b-field>
        <b-field label="3つ目 任意">
          <b-input v-model="questionnaire.choice_third"></b-input>
        </b-field>
        <b-button @click="createQuestionnaire()" class="button is-warning">
          投稿する
        </b-button>
      </div>
    </div>
    <!-- <div class="section">
    <vue-poll v-bind="options" @addvote="addVote()"></vue-poll>
  </div> -->
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
      // options: {
      //   question: "What's your favourite <strong>JS</strong> framework?",
      //   answers: [
      //     { value: 1, text: "Vue", votes: 53 },
      //     { value: 2, text: "React", votes: 35 },
      //     { value: 3, text: "Angular", votes: 30 },
      //     { value: 4, text: "Other", votes: 10 },
      //   ],
      // },
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
      this.$axios
        .post("/v1/questionnaire_choices", {
          questionnaire_id: response_questionnaire_id,
          choice: this.questionnaire.choice_first,
        })
        .then((res) => {
          console.log(res);
        })
        .catch((error) => {
          console.log(error);
        });
      this.$axios
        .post("/v1/questionnaire_choices", {
          questionnaire_id: response_questionnaire_id,
          choice: this.questionnaire.choice_second,
        })
        .then((res) => {
          console.log(res);
        })
        .catch((error) => {
          console.log(error);
        });
      if (this.questionnaire.choice_third != null) {
      this.$axios
        .post("/v1/questionnaire_choices", {
          questionnaire_id: response_questionnaire_id,
          choice: this.questionnaire.choice_second,
        })
        .then((res) => {
          console.log(res);
        })
        .catch((error) => {
          console.log(error);
        });
      } else {
        return
      }
    },
    // addVote(obj) {
    //   console.log("You voted " + obj.value + "!");
    // },
  },
};
</script>

<style lang="scss"></style>
