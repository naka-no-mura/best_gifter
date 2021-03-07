<template>
  <div v-if="pageCount" class="block pagenation-box">
    <nav class="pagination is-medium" role="navigation" aria-label="pagination">
      <ul class="pagination-list">
        <!-- 1ページ目に戻るリンク -->
        <li class="pagination-link">
          <a class="pagination-number" href="#" v-on:click.prevent="setPage(1)"
            ><<</a
          >
        </li>
        <!-- 1ページ前に戻るリンク -->
        <li class="pagination-link">
          <a
            class="pagination-number"
            href="#"
            @click.prevent="setPage(currentPage - 1)"
            ><</a
          >
        </li>
        <!-- ここからページ数分のリンクを生成 -->
        <li
          class="pagination-link"
          v-for="num in showPagesFix"
          :key="num"
          :class="{ 'is-current': numFix(num) == currentPage }"
        >
          <template v-if="numFix(num) == currentPage">
            <span class="page-link is-current">{{ numFix(num) }}</span>
          </template>
          <a
            class="pagination-number"
            href="#"
            @click.prevent="setPage(numFix(num))"
            v-else
            >{{ numFix(num) }}</a
          >
        </li>
        <!-- 1ページ次に進むリンク -->
        <li class="pagination-link">
          <a
            class="pagination-number"
            href="#"
            @click.prevent="setPage(currentPage + 1)"
            >></a
          >
        </li>
        <!-- 最後のページに進むリンク -->
        <li class="pagination-link">
          <a
            class="pagination-number"
            href="#"
            @click.prevent="setPage(pageCount)"
            >>></a
          >
        </li>
      </ul>
    </nav>
  </div>
</template>

<script>
import { mapGetters, mapActions } from "vuex";
import { changePage } from "../../../store/mutation-types";
export default {
  name: "RakutenApiPagenation",
  data() {
    return {
      currentPageEdited: Number, //現在のページ
      showPages: 5, //ページネーションを何件表示するか
      perPage: 30, //1ページあたりの表示件数
    };
  },
  computed: {
    ...mapGetters("rakuten_api", ["currentPage", "pageCount", "count"]),
    //ページ番号を計算する
    numFix() {
      var vm = this;
      return function(num) {
        var ajust = 1 + (vm.showPages - 1) / 2;
        var result = num;
        //前ページがマイナスになる場合は1からはじめる
        if (vm.currentPage > vm.showPages / 2) {
          var result = num + vm.currentPage - ajust;
        }
        //後ページが最大ページを超える場合は最大ページを超えないようにする
        if (vm.currentPage + vm.showPages / 2 > vm.pageCount) {
          var result = vm.pageCount - vm.showPages + num;
        } //総ページ数が表示ページ数に満たない場合、連番そのまま
        if (vm.pageCount <= vm.showPages) {
          var result = num;
        }
        return result;
      };
    },
    //総記事数が表示ページ数以下の場合に調整する
    showPagesFix() {
      var vm = this;
      if (vm.pageCount < vm.showPages) {
        return vm.pageCount;
      } else {
        return vm.showPages;
      }
    },
  },
  mounted() {
    var vm = this;
    vm.$set(vm, "currentPageEdited", vm.currentPage);
  },
  methods: {
    ...mapActions("rakuten_api", ["changePage", "search"]),
    //何ページ目を表示するか
    setPage(page) {
      var vm = this;
      //マイナスにならないようにする
      if (page <= 0) {
        vm.$set(vm, "currentPageEdited", 1);
      }
      //最大ページを超えないようにする
      else if (page > vm.pageCount) {
        vm.$set(vm, "currentPageEdited", vm.pageCount);
      } else {
        vm.$set(vm, "currentPageEdited", changePage);
      }
      vm.search(vm.changePage(page));
    },
  },
};
</script>

<style scoped>
.pagination-number {
  display: block !important;
  width: 100% !important;
  line-height: 3rem !important;
}
.pagination-link {
  padding: 0 !important;
  background-color: white;
}
.pagenation-box {
  margin: 2rem 0rem;
}
@media screen and (max-width: 480px) {
  .pagenation-box {
    width: 95%;
    margin: 0 auto;
  }
  .pagination-list {
  }
  .pagination-link {
    min-width: 1.3em;
    height: 1.3em;
  }
  .pagination-number {
    font-size: 1rem;
    line-height: 1rem;
  }
}
</style>
