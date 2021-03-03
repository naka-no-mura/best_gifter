<template>
  <main>
    <div class="sidebar-page">
      <section class="sidebar-layout">
        <b-sidebar
          position="static"
          :mobile="mobile"
          :expand-on-hover="expandOnHover"
          :reduce="reduce"
          type="is-white"
          open
        >
          <RakutenApiSideMenu v-show="!loading"></RakutenApiSideMenu>
        </b-sidebar>
        <div class="container">
        <RakutenApiCall v-show="!loading"></RakutenApiCall>
        <RakutenApiError v-show="!loading"></RakutenApiError>
        <RakutenApiResultHit v-show="!loading"></RakutenApiResultHit>
        <Loading v-show="loading"></Loading>
        <RakutenApiPagenation v-show="!loading"></RakutenApiPagenation>
        <RakutenApiResultList v-show="!loading"></RakutenApiResultList>
        <RakutenApiPagenation v-show="!loading"></RakutenApiPagenation>
        </div>
      </section>
    </div>
  </main>
</template>

<script>
import RakutenApiSideMenu from "./components/RakutenApiSideMenu.vue";
import RakutenApiCall from "./components/RakutenApiCall.vue";
import RakutenApiResultList from "./components/RakutenApiResultList.vue";
import RakutenApiError from "./components/RakutenApiError.vue";
import RakutenApiResultHit from "./components/RakutenApiResultHit.vue";
import RakutenApiPagenation from "./components/RakutenApiPagenation.vue";
import Loading from "./components/Loading.vue";

export default {
  name: "ItemIndex",
  components: {
    RakutenApiSideMenu,
    RakutenApiCall,
    RakutenApiResultList,
    RakutenApiError,
    RakutenApiResultHit,
    RakutenApiPagenation,
    Loading,
  },
  data() {
    return {
      loading: true,
      expandOnHover: false,
      mobile: "reduce",
      reduce: false,
    };
  },
  mounted() {
    setTimeout(() => {
      this.loading = false;
    }, 1000);
  },
};
</script>

<style lang="scss">
main {
  padding-top: 5rem;
}
.sidebar-page {
  display: flex;
  flex-direction: column;
  width: 100%;
  min-height: 100%;
  // min-height: 100vh;
  .sidebar-layout {
    display: flex;
    flex-direction: row;
    min-height: 100%;
    // min-height: 100vh;
  }
}
@media screen and (max-width: 1023px) {
  .b-sidebar {
    .sidebar-content {
      &.is-mini-mobile {
        &:not(.is-mini-expand),
        &.is-mini-expand:not(:hover) {
          .menu-list {
            li {
              a {
                span:nth-child(2) {
                  display: none;
                }
              }
              ul {
                padding-left: 0;
                li {
                  a {
                    display: inline-block;
                  }
                }
              }
            }
          }
          .menu-label:not(:last-child) {
            margin-bottom: 0;
          }
        }
      }
    }
  }
}
@media screen and (min-width: 1024px) {
  .b-sidebar {
    .sidebar-content {
      &.is-mini {
        &:not(.is-mini-expand),
        &.is-mini-expand:not(:hover) {
          .menu-list {
            li {
              a {
                span:nth-child(2) {
                  display: none;
                }
              }
              ul {
                padding-left: 0;
                li {
                  a {
                    display: inline-block;
                  }
                }
              }
            }
          }
          .menu-label:not(:last-child) {
            margin-bottom: 0;
          }
        }
      }
    }
  }
}
.is-mini-expand {
  .menu-list a {
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
  }
}
</style>
