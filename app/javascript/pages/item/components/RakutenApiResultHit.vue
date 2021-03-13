<template>
  <div>
    <!-- pcバージョン -->
    <div v-if="count" class="block pc-hit">
      <nav class="level">
        <div class="level-left">
          <div class="level-item">
            <div class="hit-count">
              {{ first.toLocaleString() }}〜{{ last.toLocaleString() }}件（{{
                count.toLocaleString()
              }}件ヒット）
            </div>
            <span>検索条件：</span>
            <b-taglist>
              <b-tag class="tag" rounded v-if="keyword">{{ keyword }}</b-tag>
              <b-tag class="tag" rounded v-if="genreId">{{
                genreIdToName(genreId)
              }}</b-tag>
              <b-tag class="tag" rounded v-if="minPrice"
                >{{ minPrice.toLocaleString() }}円〜</b-tag
              >
              <b-tag class="tag" rounded v-if="maxPrice"
                >〜{{ maxPrice.toLocaleString() }}円</b-tag
              >
              <b-tag
                class="tag"
                rounded
                v-if="!(keyword || maxPrice || minPrice || maxPrice || genreId)"
                >結婚（デフォルト検索）</b-tag
              >
              <b-button
                class="tag reset-tag"
                v-if="keyword || maxPrice || minPrice || maxPrice || genreId"
                @click="resetSearch()"
                >検索条件の解除</b-button
              >
            </b-taglist>
          </div>
        </div>
        <!-- 並び替え ここから -->
        <div class="level-right"></div>
        <div class="level-right">
          <div class="level-item">
            <label class="sort-btn" for="sort">並び替え</label>
            <div class="select">
              <select
                v-model="sort_selected.sort"
                v-if="count"
                id="sort"
                @change="
                  changeSort($event.target.value);
                  setPage(1);
                "
              >
                <option v-for="sort in sorts" :value="sort.sort" :key="sort.id">
                  {{ sort.name }}
                </option>
              </select>
            </div>
          </div>
        </div>
      </nav>
    </div>
    <!-- スマホバージョン -->
    <div v-if="count" class="block responsive-hit">
      <div class="hit-detail">
      <div class="hit-sort">
      <div class="hit-count">
        {{ first.toLocaleString() }}〜{{ last.toLocaleString() }}件（{{
          count.toLocaleString()
        }}件ヒット）
      </div>
      <div class="select is-small">
        <select
          v-model="sort_selected.sort"
          v-if="count"
          @change="
            changeSort($event.target.value);
            setPage(1);
          "
        >
          <option v-for="sort in sorts" :value="sort.sort" :key="sort.id">
            {{ sort.name }}
          </option>
        </select>
      </div>
      </div>
    </div>
    </div>
    <div class="conditions">
      <span>検索条件：</span>
      <b-taglist>
        <b-tag class="tag" rounded v-if="keyword">{{ keyword }}</b-tag>
        <b-tag class="tag" rounded v-if="genreId">{{
          genreIdToName(genreId)
        }}</b-tag>
        <b-tag class="tag" rounded v-if="minPrice"
          >{{ minPrice.toLocaleString() }}円〜</b-tag
        >
        <b-tag class="tag" rounded v-if="maxPrice"
          >〜{{ maxPrice.toLocaleString() }}円</b-tag
        >
        <b-tag
          class="tag"
          rounded
          v-if="!(keyword || maxPrice || minPrice || maxPrice || genreId)"
          >結婚（デフォルト検索）</b-tag
        >
        <b-button
          class="tag reset-tag"
          v-if="keyword || maxPrice || minPrice || maxPrice || genreId"
          @click="resetSearch()"
          >検索条件の解除</b-button
        >
      </b-taglist>
  </div>
  </div>
</template>

<script>
import { mapGetters, mapActions } from "vuex";
import { changeSort, changePage, search } from "../../../store/mutation-types";
export default {
  name: "RakutenApiResultHit",
  data() {
    return {
      // フォーム部分(プルダウン)の並び替え用
      sorts: [
        { sort: "standard", name: "標準" },
        { sort: "-reviewCount", name: "レビュー件数順" },
        { sort: "-reviewAverage", name: "レビュー評価順" },
        { sort: "-itemPrice", name: "価格が高い順" },
        { sort: "+itemPrice", name: "価格が安い順" },
        { sort: "+updateTimestamp", name: "新着順" },
      ],
      sort_selected: { sort: "standard", name: "標準" },
    };
  },
  computed: {
    ...mapGetters("rakuten_api", [
      "keyword",
      "genreId",
      "count",
      "first",
      "last",
      "page",
      "minPrice",
      "maxPrice",
    ]),
  },
  methods: {
    ...mapActions("rakuten_api", [
      "resetSearch",
      "changeSort",
      "changePage",
      "search",
    ]),
    genreIdToName(genreId) {
      if (genreId === 100433) {
        return "ルームウェア";
      } else if (genreId === 562637) {
        return "家電";
      } else if (genreId === 510915) {
        return "洋酒";
      } else if (genreId === 100804) {
        return "インテリア";
      } else if (genreId === 215783) {
        return "日用品雑貨";
      } else if (genreId === 100005) {
        return "花";
      } else if (genreId === 566732) {
        return "カタログ";
      } else if (genreId === 553283) {
        return "ギフト券・商品券";
      } else if (genreId === 558944) {
        return "キッチン用品・食器";
      }
    },
    //再検索とソート変更の時は毎回1ページ目を表示させる
    setPage(page) {
      var vm = this;
      vm.search(vm.changePage(page));
    },
  },
};
</script>

<style scoped>
.pc-hit {
  margin-left: 1rem;
}
.tag {
  background-color: #ffd3d4;
  border: none;
}
.button {
  background-color: #ffd3d4;
  border: none;
}
.button:hover {
  opacity: 0.5;
}
.hit-count {
  margin-right: 2rem;
}
.sort-btn {
  margin-right: 0.5rem;
}
.reset-tag {
  text-decoration: underline;
}
.responsive-hit {
  display: none;
}
.conditions {
  display: none;
}
@media screen and (max-width: 959px) {
  .pc-hit {
    display: block;
    width: 100%;
    padding: 9rem 0.5rem 0.5rem;
    position: fixed;
    z-index: 28;
    background-color: #f0eee9;
  }
}
@media screen and (max-width: 480px) {
  .pc-hit {
    display: none;
  }
  .responsive-hit {
    display: block;
    width: 100%;
    padding: 4rem 0.5rem 0.5rem;
    position: fixed;
    z-index: 28;
    background-color: #f0eee9;
  }
  .hit-detail {
    font-size: 0.7rem;
  }
.hit-count {
  margin: 0rem;
}
.hit-sort {
  display: flex;
  justify-content: space-around;
}
.conditions {
  display: block;
  padding: 7rem 0.5rem 0;
  font-size: 0.7rem;
}
}
</style>
