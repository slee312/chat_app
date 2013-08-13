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
  $('#checking_area').html("Latitude:" + geo.coords.latitude + "<br /> Longitude:" + geo.coords.longitude + "<br />");

  //Add Map
  var $mapDiv = $(document.createElement('div'));
  $mapDiv.attr('id', 'map').style('height', '150px');
  $('#checking_area').append($mapDiv);
  var map = L.map('map').setView([geo.coords.latitude, geo.coords.longitude],13);
  L.tileLayer('http://{s}.mqcdn.com/tiles/1.0.0/map/{z}/{x}/{y}.jpg', { attribution: 'Map data &copy; OpenStreetMap; Map tiles &copy; Mapquest', maxZoom: 18, subdomains: ['otile1', 'otile2', 'otile3', 'otile4'] }).addTo(map);

}

function error_geo_callback(geo) {
  clearTimeout(check_time_out);
  if (geo) {
    alert(geo.message);
  }
  $('#checking_area').html("<br /><br /><span class = \"error-loading-text\">There was an error in finding your location.<br / ><span class = \"button-sub-text\">If you have previously denied location access, try resetting your browser location settings.</span></span><br /><br /><button class = \"btn btn-large btn-info\" id = \"test_geo_again\" type = \"button\">Try Again</button> "); 
  $('#test_geo_again').click(checkGeoAgain);
}
