$(document).on('ready page:load', function(){

  var productCard = $('#products');

  productCard.imagesLoaded(function(){

    productCard.masonry("reloadItems");

    productCard.masonry({
      itemSelector: '.product-card',
      columnWidth: 147,
      isFitWidth: true,
      gutter: 10
    });
  });
});