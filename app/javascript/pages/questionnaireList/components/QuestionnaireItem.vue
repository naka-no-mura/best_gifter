<template>
  <div class="section questionnaire-item">
    <div>
      <p>ギフトを贈りたい相手の</p>
      <p>間柄：{{ questionnaire.relationship }}</p>
      <p>性別：{{ questionnaire.gender }}</p>
      <p>年齢：{{ questionnaire.age }}</p>
      <p>内容：{{ questionnaire.text }}</p>
    </div>
    <div>
      <!-- <b-field>
          <b-radio-button
            v-model="radioButton"
            native-value=questionnaire.questionnaire_choices[0].choice
            type="is-light"
            ><span @click="addVote1()">{{
              questionnaire.questionnaire_choices[0].choice
            }}</span></b-radio-button
          >
          <b-radio-button
            v-model="radioButton"
            native-value=Dquestionnaire.questionnaire_choices[1].choice
            type="is-light"
            ><span @click="addVote2()">{{
              questionnaire.questionnaire_choices[1].choice
            }}</span></b-radio-button
          >
          <b-radio-button
            v-model="radioButton"
            native-value=questionnaire.questionnaire_choices[2].choice
            type="is-light"
            ><span @click="addVote3()">{{
              questionnaire.questionnaire_choices[2].choice
            }}</span></b-radio-button
          >
        </b-field> -->
    </div>
    <div class="answers">
      <!-- <div v-bind:class={isClicked}>
          <p class="q-tx" v-bind:class={isClickedTx}>アンケートに投票することで結果を見ることができます</p>
        </div> -->
      <vue-poll v-bind="options" @addvote="addVote"></vue-poll>
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
        question: "",
        answers: [
          {
            value: this.questionnaire.questionnaire_choices[0].id,
            text: this.questionnaire.questionnaire_choices[0].choice,
            votes: this.questionnaire.questionnaire_choices[0].answers_count,
          },
          {
            value: this.questionnaire.questionnaire_choices[1].id,
            text: this.questionnaire.questionnaire_choices[1].choice,
            votes: this.questionnaire.questionnaire_choices[1].answers_count,
          },
          {
            value: this.questionnaire.questionnaire_choices[2].id,
            text: this.questionnaire.questionnaire_choices[2].choice,
            votes: this.questionnaire.questionnaire_choices[2].answers_count,
          },
        ],
      },
      radioButton: "",
      isClicked: true,
      isClickedTx: false,
    };
  },
  computed: {
    ...mapGetters("users", ["authUser"]),
  },
  methods: {
    // addVote1(){
    //   this.$axios.post("/v1/answers", {
    //     user_id: this.authUser.id,
    //     questionnaire_choice_id: this.questionnaire.questionnaire_choices[0].id,
    //     questionnaire_id: this.questionnaire.id
    //   })
    //   .then(res => {
    //     console.log(res)
    //     this.isClicked = false
    //     this.isClickedTx = true
    //   })
    //     .catch((error) => {
    //       this.errors = error.response.data.message;
    //       this.$toasted.show(this.errors);
    //     this.isClicked = false
    //     this.isClickedTx = true
    //     });
    // },
    // addVote2(){
    //   this.$axios.post("/v1/answers", {
    //     user_id: this.authUser.id,
    //     questionnaire_choice_id: this.questionnaire.questionnaire_choices[1].id,
    //     questionnaire_id: this.questionnaire.id
    //   })
    //   .then(res => {
    //     console.log(res)
    //     this.isClicked = false
    //     this.isClickedTx = true
    //   })
    //     .catch((error) => {
    //       this.errors = error.response.data.message;
    //       this.$toasted.show(this.errors);
    //     this.isClicked = false
    //     this.isClickedTx = true
    //     });
    // },
    // addVote3(){
    //   this.$axios.post("/v1/answers", {
    //     user_id: this.authUser.id,
    //     questionnaire_choice_id: this.questionnaire.questionnaire_choices[2].id,
    //     questionnaire_id: this.questionnaire.id
    //   })
    //   .then(res => {
    //     console.log(res)
    //     this.isClicked = false
    //     this.isClickedTx = true
    //   })
    //     .catch((error) => {
    //       this.errors = error.response.data.message;
    //       this.$toasted.show(this.errors);
    //     this.isClicked = false
    //     this.isClickedTx = true
    //     });
    // },
    addVote: function(obj) {
      return this.$axios
        .post("/v1/answers", {
          user_id: this.authUser.id,
          questionnaire_choice_id: obj.value,
          questionnaire_id: this.questionnaire.id,
        })
        .then((res) => {
          console.log(res);
          this.$toasted.success('アンケートに投票しました');
          // this.isClicked = false
          // this.isClickedTx = true
        })
        .catch((error) => {
          console.log(error);
          // for (let key of Object.keys(error)) {
          //   console.log(key);
          //   console.log(error[key]);
          // }
          this.$toasted.error(error.response.data.message);
          // this.isClicked = false
          // this.isClickedTx = true
        });
    },
  },
};
</script>

<style lang="scss">
.questionnaire-item {
  -webkit-transition: 0.3s;
  transition: 0.3s;
  border-radius: 1rem;
}
.questionnaire-item:hover {
  background-color: #f8f8f8;
}
.answers {
  position: relative;
}
// .isClicked {
//   position: absolute;
//   top: 0;
//   left: 0;
//   z-index: 2;
//   width: 100%;
//   height: 100%;
//   -webkit-transition: .3s;
//   transition: .3s;
//   opacity: 1;
//   text-align: center;
//   background-image: url("../../../../assets/images/questionnaire_image.jpg");
//   background-size: cover;
// }
// .q-tx {
//   margin-top: 3rem;
//   color: white;
//   font-size: 1.3em;
//   text-shadow: 0 0 1rem #333;
// }
.isClickedTx {
  display: none;
}
</style>
