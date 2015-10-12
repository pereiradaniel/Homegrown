function geolocationSuccess(position) {
  var latitude  = position.coords.latitude;
  var longitude = position.coords.longitude;
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
      data: {
        longitude: longitude,
        latitude: latitude
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

