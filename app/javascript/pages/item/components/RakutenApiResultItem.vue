<template>
  <div>
    <div class="card">
      <a target="_blank" :href="item.Item.itemUrl">
        <div class="card-image">
          <figure class="image">
            <img :src="item.Item.mediumImageUrls[0].imageUrl" />
          </figure>
        </div>
        <div class="content">
          <p>{{ item.Item.itemName }}</p>
            <div class="columns">
              <star-rating
                v-model="item.Item.reviewAverage"
                :increment="0.01"
                read-only
                :star-size="15"
                class="column"
              ></star-rating>
            <div class="column">({{ item.Item.reviewCount }}件)</div>
            </div>
          <p>{{ item.Item.itemPrice }}円</p>
        </div>
      </a>
    </div>
  </div>
</template>

<script>
export default {
  name: "RakutenApiResultItem",
  props: {
    item: Object,
    required: true,
  },
};
</script>
<style scope></style>
