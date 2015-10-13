function geolocationSuccess(position) {
  var latitude  = position.coords.latitude;
  var longitude = position.coords.longitude;
  var searchvar = $('#search-field').val();
  var proximity = $('#proximity').val();
  if(garden != undefined){
    $.ajax({
      url: '/gardens',
      method: 'GET',
      data: {
        longitude: longitude,
        latitude: latitude
      },
      dataType: 'script'
    });
  } else if(product){
    $.ajax({
      url: '/products',
      method: 'GET',
      // How to add query search here???
      data: {
        longitude: longitude,
        latitude: latitude,
        search: searchvar,
        proximity: proximity
      },
      dataType: 'script'
    });
  }
}

function geolocationError() {
  console.log("please enable location for this feature to work!");
  // display this message in some div on the index page
}



function Map(mapId){
  this.mapId = mapId;
}

Map.prototype.init = function(latitude, longitude){
  var options = {
    center: {lat: latitude, lng: longitude},
    zoom: 15,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  };

  this.map = new google.maps.Map(this.mapId, options);
}

$(document).on('ready page:load', function(){
  if($('#map-canvas').length){
    var latitude = $('#map-canvas').data('latitude');
    var longitude = $('#map-canvas').data('longitude');
    window.myMap = new Map($('#map-canvas')[0]);
    window.myMap.init(latitude, longitude);
  }

    updateRangeValue($('input[type=range]'));
    $('input[type=range]').on('input change',function(){
      var input = $(this);
      updateRangeValue(input);
    });    

    function updateRangeValue(input){
      var value = input.val();
      // var maximum = input.attr('max'); 
      // var inputWidth = input.width();
      // var offLeft = Math.floor((value / maximum) * inputWidth - (((value / maximum) * inputWidth - inputWidth/2) / 100) * 24);    
      // var offLeftAbs = value == maximum ? input.offset().left - 15 + offLeft : input.offset().left - 10 + offLeft;
      // input.next('.rangevalue').css({'left': offLeftAbs +'px'});
      input.next('.rangevalue').html(value);
    }

$("#garden-location").on("click", function(event) {
    event.preventDefault();
    garden = $(this).data;
    if ("geolocation" in navigator) {
      navigator.geolocation.getCurrentPosition(geolocationSuccess, geolocationError);
    } else {
      alert("Please dump your crappy browser and use Chrome!");
    }
  }); 

$("#product-location").on("click", function(event) {
    event.preventDefault();
    product = $(this).data;
    garden = undefined;
    if ("geolocation" in navigator) {
      navigator.geolocation.getCurrentPosition(geolocationSuccess, geolocationError);
    } else {
      alert("Please dump your crappy browser and use Chrome!");
    }
  }); 

});

