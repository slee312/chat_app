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
  $('#checking_area').html("Latitude:" + geo.latitude + "<br /> Longitude:" + geo.longitude);
}

function error_geo_callback(geo) {
  if (geo) {
    alert(geo.message);
  }
  clearTimeout(check_time_out);
  $('#checking_area').html("<br /><br /><span class = \"error-loading-text\">There was an error in finding your location.<br / ><span class = \"button-sub-text\">If you have previously denied location access, try resetting your browser location-based settings.</span></span><br /><br /><button class = \"btn btn-large btn-info\" id = \"test_geo_again\" type = \"button\">Try Again</button> "); 
  $('#test_geo_again').click(checkGeoAgain);
}
