$(document).on('ready page:load', function(){
  // var $productCard = $('.products').masonry({
  //     itemSelector: '.product-card',
  //     columnWidth: 153.406,
  //     isFitWidth: true
  //   });

  // $productCard.imagesLoaded().progress(function(){
  //   $productCard.masonry('layout');
  // });


    var productCard = $('#products').masonry({
      itemSelector: '.product-card',
      columnWidth: 153.406,
      isFitWidth: true
    });

  productCard.imagesLoaded().progress(function(){
    productCard.masonry('layout');
  });
});