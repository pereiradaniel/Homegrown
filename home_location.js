  function setCookie(latitude, longitude) {
    document.cookie = "location=[latitude, longitude]; expires=Thu, 18 Dec 2015 12:00:00 UTC";
  }

  // How to get session cookie(that stores location info) here?
  function getCookie(location) {
    return document.cookie;
  }

  function checkCookie() {
    var location = getCookie();
    // if locations doesn't exist, set location
    if (location == []) {
      console.log("Setting location cookie!");
      if ("geolocation" in navigator) {
        navigator.geolocation.getCurrentPosition(geolocationSession);
      }else{
        alert("Browser does not support geocoding");
      }

      function geolocationSession(position, isLocationDisabled) {

        var latitude  = position.coords.latitude;
        var longitude = position.coords.longitude;

        setCookie(latitude, longitude);

        $.ajax({
          url: '/products/home',
          method: 'GET',
          data: {
            longitude: longitude,
            latitude: latitude
          },
          dataType: 'script'
        });
      }
    }
  }

  checkCookie();
