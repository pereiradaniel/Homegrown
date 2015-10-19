$(document).on('ready page:load', function(){
  var productCard = $('#products').masonry({
    itemSelector: '.product-card',
    columnWidth: 147,
    isFitWidth: true
  });

  productCard.imagesLoaded().progress(function(){
    productCard.masonry('layout');
  });
});