<template>
  <div class="container">
    <div class="section q-tl">
        <h1 class="title tl-shadow">Vote &amp; Result</h1>
        <h1 class="title tl-relative">みんなのアンケート結果</h1>
    <p class="subtitle v-tl">みんなのアンケートがヒントになるかもしれません。</br>
    投票することで結果を見ることができます。</p>
    </div>
    <QuestionnaireList></QuestionnaireList>
  </div>
</template>

<script>
import QuestionnaireList from "./components/QuestionnaireList.vue";

export default {
  name: "QuestionnaireListIndex",
  components: {
    QuestionnaireList,
  },
  created() {
    this.getQuestionnaires();
  },
  methods: {
    getQuestionnaires() {
      return this.$axios
        .get("/v1/questionnaires")
        .then((res) => {
          this.$data.questionnaires = res.data;
          // for (let key of Object.keys(res)) {
          //   console.log(key);
          //   console.log(res[key]);
          // }
        })
        .catch((err) => {
          console.log(err);
        });
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
</style>
