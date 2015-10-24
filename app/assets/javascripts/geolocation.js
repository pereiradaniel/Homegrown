function geolocationSuccess(position, isLocationDisabled) {
  var searchvar = $('#search-field').val();
  var proximity = $('#proximity').val();
  var searchFor = $('#search-button').val()
  var login = $("#login").val();

  if(position != undefined){
    var latitude  = position.coords.latitude;
    var longitude = position.coords.longitude;
    var noloc = "false";
    var request_object = {
      longitude: longitude,
      latitude: latitude,
      search: searchvar,
      proximity: proximity
    };

  }else{
    // alert("Please enable location for proximity search to work!");
    var noloc = "true";
    var request_object = {
      search: searchvar,
      noloc: noloc
    };
  }

  if(searchFor == 'product-search'){
    var urlVar = '/products';
  }else if(searchFor == 'garden-search'){
    var urlVar = '/gardens';
  };

  $.ajax({
    url: urlVar,
    method: 'GET',
    data: request_object,
    dataType: 'script'
  });
}

function geolocationError() {
  // alert("Please enable location for proximity search to work!");
  var no_position = undefined;
  geolocationSuccess(no_position);
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
      input.next('.rangevalue').html(value + ' kilometers');
    }

$("#garden-location").on("click", function(event) {
    event.preventDefault();
    garden = $(this).data;
    getLocation();
  });

$("#search-button").on("click", function(event) {
    event.preventDefault();
    getLocation();
  });

});

function getLocation() {
  if ("geolocation" in navigator) {
    navigator.geolocation.getCurrentPosition(geolocationSuccess, geolocationError);
  } else {
    alert("Browser does not support geocoding");
  }
}
