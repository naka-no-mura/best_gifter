<template>
  <div class="sidebar-page">
    <section class="sidebar-layout">
      <b-sidebar
        position="static"
        :mobile="mobile"
        :expand-on-hover="expandOnHover"
        :reduce="reduce"
        type="is-white"
        open
        class="reserch-sidebar"
      >
        <RakutenApiSideMenu v-show="!loading" />
      </b-sidebar>
      <div class="container inner">
        <RakutenApiCall v-show="!loading" />
        <RakutenApiError v-show="!loading" />
        <RakutenApiResultHit v-show="!loading" />
        <Loading v-show="loading" />
        <RakutenApiPagenation v-show="!loading" />
        <RakutenApiResultList v-show="!loading" />
        <RakutenApiPagenation
          v-show="!loading"
          style="margin-top:2rem"
        />
      </div>
    </section>
  </div>
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
.b-sidebar .sidebar-content.is-static {
    position: static;
    margin-top: 5rem;
}
@media screen and (max-width: 959px) {
  .reserch-sidebar {
    display: none;
  }
}
@media screen and (max-width: 480px) {
  .reserch-sidebar {
    display: none;
  }
}
</style>
