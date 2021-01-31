<template>
  <!-- 検索フォーム ここから -->
  <div class="section">
    <ValidationObserver
      v-slot="{ invalid }"
      tag="form"
      @click.prevent="search()"
    >
      <ValidationProvider rules="requiredKeyword" v-slot="{ errors }">
        <b-field class="b-field">
          <span>キーワードで絞る　：</span>
          <div>
            <input
              class="input"
              type="text"
              v-model="keywordBox"
              name="キーワード"
              placeholder="複数入力可能（任意）"
              @input="changeKeyword($event.target.value)"
            />
          </div>
          <span class="flash-message">{{ errors[0] }}</span>
        </b-field>
      </ValidationProvider>
      <ValidationProvider rules="min:0" v-slot="{ errors }">
        <b-field class="b-field">
          <span>価格下限を設定する：</span>
          <div>
            <input
              class="input"
              type="number"
              v-model="minPriceBox"
              name="価格下限"
              placeholder="0以上の数値（任意）"
              @input="changeMinPrice($event.target.value)"
            />
          </div>
          <span class="flash-message">{{ errors[0] }}</span>
        </b-field>
      </ValidationProvider>
      <ValidationProvider rules="min:0" v-slot="{ errors }">
        <b-field class="b-field">
          <span>価格上限を設定する：</span>
          <div>
            <input
              class="input"
              type="number"
              v-model="maxPriceBox"
              name="価格上限"
              placeholder="0以上の数値（任意）"
              @input="changeMaxPrice($event.target.value)"
            />
          </div>
          <span class="flash-message">{{ errors[0] }}</span>
        </b-field>
      </ValidationProvider>
      <b-field>
        <div>
          <button
            class="button is-warning"
            type="submit"
            @click="
              keywordSearch();
              search();
            "
            :disabled="invalid"
          >
            検索
          </button>
        </div>
        <!-- フォーム内クリア -->
        <button @click="formClear()" class="button is-warning is-light">
          クリア
        </button>
      </b-field>
      <!-- 検索フォーム ここまで -->
    </ValidationObserver>
  </div>
</template>
<script>
import { mapActions } from "vuex";
import {
  changeKeyword,
  changeMinPrice,
  changeMaxPrice,
  search,
} from "../../../store/mutation-types";
export default {
  name: "RakutenApiCallTopVer",
  data() {
    return {
      keywordBox: "",
      minPriceBox: "",
      maxPriceBox: "",
    };
  },
  methods: {
    ...mapActions([
      "changeKeyword",
      "changeMinPrice",
      "changeMaxPrice",
      "search",
    ]),
    formClear() {
      this.keywordBox = "";
      this.minPriceBox = "";
      this.maxPriceBox = "";
    },
    keywordSearch() {
      this.$router.push("/items");
    },
  },
};
</script>
<style scoped>
.b-field {
  margin: 0.5rem;
}
.flash-message {
  color: red;
  margin: 0.5rem;
}
.button {
  margin: 0.5rem;
  width: 15rem;
}
</style>
