<template>
  <div>
    <div class="section">
      <vue-poll v-bind="options" showResults ></vue-poll>
      <div>
        <p>ギフトを贈りたい方の</p>
        <p>間柄：{{ questionnaire.relationship }}</p>
        <p>性別：{{ questionnaire.gender }}</p>
        <p>年齢：{{ questionnaire.age }}</p>
      </div>
      <div>
        <b-field>
          <b-radio-button
            v-model="radioButton"
            native-value=questionnaire.questionnaire_choices.[0].choice
            type="is-primary is-light is-outlined"
            ><span @click="addVote1()">{{
              questionnaire.questionnaire_choices[0].choice
            }}</span></b-radio-button
          >
          <b-radio-button
            v-model="radioButton"
            native-value=Dquestionnaire.questionnaire_choices.[1].choice
            type="is-primary is-light is-outlined"
            ><span @click="addVote2()">{{
              questionnaire.questionnaire_choices[1].choice
            }}</span></b-radio-button
          >
          <b-radio-button
            v-model="radioButton"
            native-value=questionnaire.questionnaire_choices.[2].choice
            type="is-primary is-light is-outlined"
            ><span @click="addVote3()">{{
              questionnaire.questionnaire_choices[2].choice
            }}</span></b-radio-button
          >
        </b-field>
      </div>
    </div>
  </div>
</template>

<script>
import axios from "../../../plugins/axios";
import { mapGetters } from "vuex";
export default {
  name: "QuestionnaireItem",
  props: {
    questionnaire: Object,
  },
  data() {
    return {
      options: {
        question: this.questionnaire.text,
        answers: [
          { value: this.questionnaire.questionnaire_choices[0].id, text: this.questionnaire.questionnaire_choices[0].choice, votes: this.questionnaire.questionnaire_choices[0].answers_count },
          { value: this.questionnaire.questionnaire_choices[1].id, text: this.questionnaire.questionnaire_choices[1].choice, votes: this.questionnaire.questionnaire_choices[1].answers_count },
          { value: this.questionnaire.questionnaire_choices[2].id, text: this.questionnaire.questionnaire_choices[2].choice, votes: this.questionnaire.questionnaire_choices[2].answers_count },
        ],
      },
      radioButton: ''
    }
  },
  computed: {
    ...mapGetters("users", ["authUser"]),
  },
  methods: {
    addVote1(){
      this.$axios.post("/v1/answers", {
        user_id: this.authUser.id,
        questionnaire_choice_id: this.questionnaire.questionnaire_choices[0].id,
        questionnaire_id: this.questionnaire.id
      })
      .then(res => {
        console.log(res)
      })
        .catch((error) => {
          this.errors = error.response.data.message;
          this.$toasted.show(this.errors);
        });
    },
    addVote2(){
      this.$axios.post("/v1/answers", {
        user_id: this.authUser.id,
        questionnaire_choice_id: this.questionnaire.questionnaire_choices[1].id,
        questionnaire_id: this.questionnaire.id
      })
      .then(res => {
        console.log(res)
      })
        .catch((error) => {
          this.errors = error.response.data.message;
          this.$toasted.show(this.errors);
        });
    },
    addVote3(){
      this.$axios.post("/v1/answers", {
        user_id: this.authUser.id,
        questionnaire_choice_id: this.questionnaire.questionnaire_choices[2].id,
        questionnaire_id: this.questionnaire.id
      })
      .then(res => {
        console.log(res)
      })
        .catch((error) => {
          this.errors = error.response.data.message;
          this.$toasted.show(this.errors);
        });
    },
  }
};
</script>

<style lang="scss"></style>
