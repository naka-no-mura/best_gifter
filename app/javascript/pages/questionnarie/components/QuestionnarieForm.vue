<template>
<div>
  <div class="section">
    <p class="title">アンケート投稿</p>
    <div class="section">
    <b-field label="投稿内容">
      <b-input maxlength="200" type="textarea"></b-input>
    </b-field>
    <b-field label="1つ目">
      <b-input placeholder="必須（最大25文字）"></b-input>
    </b-field>
    <b-field label="2つ目">
      <b-input placeholder="必須（最大25文字）"></b-input>
    </b-field>
    <b-field label="3つ目">
      <b-input placeholder="任意（最大25文字）"></b-input>
    </b-field>
    <b-field label="4つ目">
      <b-input placeholder="任意（最大25文字）"></b-input>
    </b-field>
    <!-- <b-field label="投票を受け付ける期間">
      <b-input></b-input>
    </b-field> -->
    <b-button @click="tweetQuestionnarie()" class="button is-warning">
      投稿する
    </b-button>
    </div>
  </div>
  <div class="section">
    <vue-poll v-bind="options" @addvote="addVote()"></vue-poll>
  </div>
  </div>
</template>

<script>
import axios from "../../../plugins/axios";
export default {
  name: "QuestionnarieForm",
  data() {
    return {
      tweets: [],
      options: {
        question: "What's your favourite <strong>JS</strong> framework?",
        answers: [
          { value: 1, text: "Vue", votes: 53 },
          { value: 2, text: "React", votes: 35 },
          { value: 3, text: "Angular", votes: 30 },
          { value: 4, text: "Other", votes: 10 },
        ],
      },
    };
  },
  methods: {
    tweetQuestionnarie() {
      axios
        .post("/v1/twitter", {
          name: "テスト",
          first_choice: "1",
          second_choice: "2",
          duration_in_minutes: 5,
        })
        .then((res) => {
          this.tweets = res.data;
        });
    },
    addVote(obj) {
      console.log("You voted " + obj.value + "!");
    },
  },
};
</script>

<style lang="scss"></style>
