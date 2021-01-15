<template>
  <div>
    <b-field>
      <input class="text" type="text" placeholder="キーワードを入力する" @change="CHANGE_KEYWORD($event.target.value)" />
      <select class="select_box" v-model="genreId_selected" @change="CHANGE_GENRE_ID($event.target.value)">
        <option disabled value="" >ジャンルで選ぶ</option>
        <option v-for="genreId in genreIds" :value="genreId.genreId" :key="genreId.id">
          {{ genreId.name }}
        </option>
      </select>
      <input class="text" type="text" placeholder="最小価格を入力する" @change="CHANGE_MIN_PRICE($event.target.value)" />
      <input class="text" type="text" placeholder="最大価格を入力する" @change="CHANGE_MAX_PRICE($event.target.value)" />
      <input class="submit" type="submit" value="検索" @click="SEARCH" />
    </b-field>
    <b-field>
      <select class="select_box" v-model="sort_selected.sort" @change="CHANGE_SORT($event.target.value)">
        <option v-for="sort in sorts" :value="sort.sort" :key="sort.id">
          {{ sort.name }}
        </option>
      </select>
      <input class="submit" type="submit" value="並び替える" @click="SEARCH" />
    </b-field>
  </div>
</template>

<script>
import { mapActions } from 'vuex'
import { CHANGE_KEYWORD, CHANGE_GENRE_ID, CHANGE_MIN_PRICE, CHANGE_MAX_PRICE, CHANGE_SORT, SEARCH } from '../../../store/mutation-types'
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
      genreId_selected: '',
      sorts: [
        { sort: 'standard', name: '標準' },
        { sort: '+reviewCount', name: 'レビュー件数順' },
        { sort: '+reviewAverage', name: 'レビュー評価順' },
        { sort: '-itemPrice', name: '価格が高い順' },
        { sort: '+itemPrice', name: '価格が安い順' },
        { sort: '+updateTimestamp', name: '新着順' },
      ],
      sort_selected: { sort: 'standard', name: '標準' },
    }
  },
  methods: {
    ...mapActions([
      CHANGE_KEYWORD, CHANGE_GENRE_ID, CHANGE_MIN_PRICE, CHANGE_MAX_PRICE, CHANGE_SORT, SEARCH
    ])
  }
}
</script>

<style scope>
.select_box {
  width: 10rem;
}
</style>
