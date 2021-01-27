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
          <p>{{ sliceItemName(item.Item.itemName) }}</p>
          <div class="columns">
            <star-rating
              v-model="item.Item.reviewAverage"
              :increment="0.01"
              read-only
              :star-size="15"
              class="column"
            ></star-rating>
            <span class="column">({{ item.Item.reviewCount.toLocaleString() }}件)</span>
          </div>
          <p>{{ item.Item.itemPrice.toLocaleString() }}円</p>
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
  methods: {
    sliceItemName(itemName) {
      if (itemName.length > 40) {
        return itemName.slice(0, 40) + "...";
      } else {
        return itemName;
      }
    },
  },
};
</script>
<style scope></style>
