<template>
  <div>
    <b-field>
      <b-input maxlength="200" type="textarea"></b-input>
    </b-field>
    <b-field label="1つ目">
      <b-input value="Kevin Garvey"></b-input>
    </b-field>
    <b-field label="2つ目">
      <b-input value="Kevin Garvey"></b-input>
    </b-field>
    <b-field label="3つ目">
      <b-input value="Kevin Garvey"></b-input>
    </b-field>
    <b-field label="4つ目">
      <b-input value="Kevin Garvey"></b-input>
    </b-field>
    <b-button @click="tweetQuestionnarie()">
      ツイート
    </b-button>
  </div>
</template>

<script>
import axios from "../../../plugins/axios";
export default {
  name: "QuestionnarieForm",
  methods: {
    tweetQuestionnarie() {
      return axios.post(
        "https://ads-api.twitter.com/5/accounts/:Best_Gifter/cards/poll",
        {
          name: 'テスト',
          first_choice: 1,
          second_choice: 2,
          duration_in_minutes: 5,
        }
      );
    },
  },
};
</script>

<style lang="scss"></style>
