$(document).on('ready page:load', function(){

  var productCard = $('#products');

  productCard.imagesLoaded(function(){

    productCard.masonry({
      itemSelector: '.product-card',
      columnWidth: 145,
      isFitWidth: true,
      gutter: 10
    });
  });
});