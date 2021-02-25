<template>
  <div class="container">
    <div class="section q-tl">
    <h1 class="title">みんなのアンケート結果</h1>
    <p>みんなのアンケートがヒントになるかもしれません。</p>
    <p>投票することで結果を見ることができます。</p>
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

<style lang="scss">
.q-tl {
  text-align: center;
}
</style>
