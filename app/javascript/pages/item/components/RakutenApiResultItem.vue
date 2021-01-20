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
        <span>{{ item.Item.itemPrice }}円</span>
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
