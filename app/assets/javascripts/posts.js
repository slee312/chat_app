//= require application

$(document).ready(function() {
    $('#load-left').hide();
    setUpMap();
    setUpPostbox();
    setUpPostSizes();
    setUpExpandButton();
});

function setUpExpandButton() {
    $('.expand-bar').mouseover(function() {
        $('#expand-icons').fadeTo(.1, 1);
    });
    $('.expand-bar').mouseout(function() {
        $('#expand-icons').fadeTo(.1, .7);
    });
}

function setUpPostSizes() {
    setPostHeights();
    $(window).resize(setPostHeights);
}

function setPostHeights() {
    $('.post-content').each(function() {
        $(this).css('height', 'auto');
        if ($(this).height() < 100) { // make sure it's big enough to fit the rating bar
            $(this).height($(this).height() + 50); // increase height by 20 on top of default text height
        }
        $(this).parent().next().next().children('.post-mid').height($(this).height());
        $(this).parent().parent().height($(this).height() + 50); // 50 is the combined height of the top and bot sections
    });
}

function setUpPostbox() {
    resizePostbox();
    $(window).resize(resizePostbox);
    $('#post-writer').focus(function() {
        $(this).animate({ height: '90px'}, 300);
    });
    $('#post-writer').focusout(function() {
        if($.trim($(this).val()) == "") {
            $(this).animate({ height: '20px'}, 300);
        }
    });
}

function resizePostbox() {
    $('#post-writer').css("width", $('#post-writer').parent().width() - 20);
}

function setUpMap() {
  L.Icon.Default.imagePath = "/assets";
  var map = L.map('map').setView([22.2833, 114.1500],16);
  var attr_info = "Tiles Courtesy of <a href=\"http://www.mapquest.com/\" target=\"_blank\">MapQuest</a>; Data &copy; <a href=\"http://www.openstreetmap.org\" target=\"blank\">OpenStreetMap</a>";
  L.tileLayer('http://{s}.mqcdn.com/tiles/1.0.0/map/{z}/{x}/{y}.jpg', { attribution: attr_info, maxZoom: 18, subdomains: ['otile1', 'otile2', 'otile3', 'otile4'] }).addTo(map);

  //Add Map Marker
  var here_marker = L.marker([22.2833, 114.1500]).addTo(map);
}

