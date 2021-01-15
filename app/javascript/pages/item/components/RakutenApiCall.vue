<template>
  <div>
    <b-field>
      <input class="text" type="text" placeholder="キーワードを入力する" @change="CHANGE_KEYWORD($event.target.value)" />
      <select  class="select_box" v-model="genreId" @change="CHANGE_GENRE_ID($event.target.value)">
        <option value="" >ジャンルで選ぶ</option>
        <option v-for="genreId in genreIds" :value="genreId.genreId" :key="genreId.id">
          {{ genreId.name }}
        </option>
      </select>
      <input class="text" type="text" placeholder="最小価格を入力する" @change="CHANGE_MIN_PRICE($event.target.value)" />
      <input class="text" type="text" placeholder="最大価格を入力する" @change="CHANGE_MAX_PRICE($event.target.value)" />
      <input class="submit" type="submit" value="検索" @click="SEARCH" />
    </b-field>
  </div>
</template>

<script>
import { mapActions } from 'vuex'
import { CHANGE_KEYWORD, CHANGE_GENRE_ID, CHANGE_MIN_PRICE, CHANGE_MAX_PRICE, SEARCH } from '../../../store/mutation-types'
export default {
  name: 'RakutenApiCall',
  data() {
    return {
      genreIds: [
        { genreId: 100433, name: 'ルームウェア' },
        { genreId: 562637, name: '家電' },
        { genreId: 510915, name: '洋酒' },
        { genreId: 100804, name: 'インテリア' },
        { genreId: 215783, name: '日用品雑貨' },
        { genreId: 558944, name: 'キッチン用品・食器' },
        { genreId: 100005, name: '花' },
        { genreId: 566732, name: 'カタログ' },
        { genreId: 553283, name: 'ギフト券・商品券' },
      ],
      genreId: ''
    }
  },
  methods: {
    ...mapActions([
      CHANGE_KEYWORD, CHANGE_GENRE_ID, CHANGE_MIN_PRICE, CHANGE_MAX_PRICE, SEARCH
    ])
  }
}
</script>

<style scope>
.select_box {
  width: 10rem;
}
</style>
