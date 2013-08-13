var check_time_out;

$(document).ready(function() {
  $('#test_geo').click(checkGeo);
});

function checkGeoAgain() {
  clearTimeout(check_time_out);
  checkGeo();
}
function checkGeo() {
  check_time_out = setTimeout(function() { error_geo_callback(null); }, 20000);
  if (geoPosition.init()) {
    $('#checking_area').html("<br /><br /><span class = \"loading-text\">Checking your location...</span>");
    geoPosition.getCurrentPosition(success_geo_callback, error_geo_callback, {enableHighAccuracy: true});
    
  } else {
    $('#checking_area').html("<br /><br /><span class = \"error-loading-text\">Looks like your browser doesn't support geolocaton detection.<br />Try updating!</span>");
  }
}

function success_geo_callback(geo) {
  clearTimeout(check_time_out);
  var user_lat = geo.coords.latitude;
  var user_long = geo.coords.longitude;

  //Print lat and long
  $('#checking_area').html("Latitude:" + user_lat + "<br /> Longitude:" + user_long + "<br />");

  //Add Map
  var $mapDiv = $(document.createElement('div'));
  $mapDiv.attr('id', 'map').css('height', '450px');
  $('#checking_area').append($mapDiv);
  var map = L.map('map').setView([user_lat, user_long],13);
  L.tileLayer('http://{s}.mqcdn.com/tiles/1.0.0/map/{z}/{x}/{y}.jpg', { attribution: 'Map data &copy; OpenStreetMap; Map tiles &copy; Mapquest', maxZoom: 18, subdomains: ['otile1', 'otile2', 'otile3', 'otile4'] }).addTo(map);
  var here_marker = L.marker([user_lat, user_long]).addTo(map);
}

function error_geo_callback(geo) {
  clearTimeout(check_time_out);
  if (geo) {
    alert(geo.message);
  }
  $('#checking_area').html("<br /><br /><span class = \"error-loading-text\">There was an error in finding your location.<br / ><span class = \"button-sub-text\">If you have previously denied location access, try resetting your browser location settings.</span></span><br /><br /><button class = \"btn btn-large btn-info\" id = \"test_geo_again\" type = \"button\">Try Again</button> "); 
  $('#test_geo_again').click(checkGeoAgain);
}
