$(document).on('ready page:load', function(){

  var breakpoints = {
    small: 145,
    medium: 236
  };

  var productCard = $('#products');

  productCard.imagesLoaded(function(){

    productCard.masonry({
      itemSelector: '.product-card',
      columnWidth: 145,
      isFitWidth: true,
      gutter: 8
    });
  });
});