var check_time_out;

$(document).ready(function() {
  $('#test_geo').click(checkGeo);
});

function checkGeoAgain() {
  clearTimeout(check_time_out);
  checkGeo();
}

function checkGeo() {
  //remove any flash alerts
  $('#flash-alerts').html("");
  check_time_out = setTimeout(function() { error_geo_callback(null); }, 20000);
  if (geoPosition.init()) {
    $('#checking_area').html("<br /><br /><span class = \"loading-text\">Checking your location...</span>");
    geoPosition.getCurrentPosition(success_geo_callback, error_geo_callback, {enableHighAccuracy: true, timeout: 20000});
    
  } else {
    $('#checking_area').html("<br /><br /><span class = \"error-loading-text\">Looks like your browser doesn't support geolocaton detection.<br />Try updating!</span>");
  }
}

function success_geo_callback(geo) {
  clearTimeout(check_time_out);
  var user_lat = geo.coords.latitude;
  var user_long = geo.coords.longitude;

  //Print lat and long
  $('#checking_area').html("<br /><h3>We think you are here:</h3> <br /><br />");

  //Add Map
  L.Icon.Default.imagePath = "/assets";
  var $mapDiv = $(document.createElement('div'));
  $mapDiv.attr('id', 'map').css('height', '250px');
  $('#checking_area').append($mapDiv);
  var map = L.map('map').setView([user_lat, user_long],13);
  var attr_info = "Tiles Courtesy of <a href=\"http://www.mapquest.com/\" target=\"_blank\">MapQuest</a>; Data &copy; <a href=\"http://www.openstreetmap.org\" target=\"blank\">OpenStreetMap</a>";
  L.tileLayer('http://{s}.mqcdn.com/tiles/1.0.0/map/{z}/{x}/{y}.jpg', { attribution: attr_info, maxZoom: 18, subdomains: ['otile1', 'otile2', 'otile3', 'otile4'] }).addTo(map);

  //Add Map Marker
  var here_marker = L.marker([user_lat, user_long]).addTo(map);
  
  //Add hidden coords
  $('#verify_long').val(user_long);
  $('#verify_lat').val(user_lat);

  createLoadBar(function() { $('#verify-location-form').submit(); }, 2000, $('#checking_area'));
}

//creates a loading bar with a callback function after the designated amouont of time, appended in the designated jQuery element
function createLoadBar(func, duration, element) {
    var loading_box = $(document.createElement("div"));
    loading_box.attr("class", "progress progress-striped");
    var loading_bar = $(document.createElement("div"));
    loading_bar.attr({ "class": "bar", "style": "width: 0px"});
    loading_box.append(loading_bar);
    element.append(loading_box);
    loading_bar.animate({ width: loading_box.width() + "px"}, duration, func);
}


function error_geo_callback(geo) {
  clearTimeout(check_time_out);
  var errorMsg;
  if (geo && geo.message.indexOf('expired') < 0) {
   errorMsg = "There was an error in finding your location.<br / ><span class = \"button-sub-text\">If you have previously denied location access, try resetting your browser location settings.</span>";
  } else {
    errorMsg = "Geotracking timed out. Please try again later.";
  }

  $('#checking_area').html("<br /><br /><span class = \"error-loading-text\">" + errorMsg + "</span><br /><br /><button class = \"btn btn-large btn-info\" id = \"test_geo_again\" type = \"button\">Try Again</button> "); 
  $('#test_geo_again').click(checkGeoAgain);
}
