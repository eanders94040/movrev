// TODO: DRY (don't repeat yourself)

$(document).ready(function(){
  $("#star1").mouseover(function() {
    $("#star1").html("&starf;");
    $("#star2").html("&star;");
    $("#star3").html("&star;");
    $("#star4").html("&star;");
    $("#star5").html("&star;");
    $('#rating').val("1");
  });

  $("#star2").mouseover(function() {
    $("#star1").html("&starf;");
    $("#star2").html("&starf;");
    $("#star3").html("&star;");
    $("#star4").html("&star;");
    $("#star5").html("&star;");
    $('#rating').val("2");
  });

  $("#star3").mouseover(function() {
    $("#star1").html("&starf;");
    $("#star2").html("&starf;");
    $("#star3").html("&starf;");
    $("#star4").html("&star;");
    $("#star5").html("&star;");
    $('#rating').val("3");
  });

  $("#star4").mouseover(function() {
    $("#star1").html("&starf;");
    $("#star2").html("&starf;");
    $("#star3").html("&starf;");
    $("#star4").html("&starf;");
    $("#star5").html("&star;");
    $('#rating').val("4");
  });

  $("#star5").mouseover(function() {
    $("#star1").html("&starf;");
    $("#star2").html("&starf;");
    $("#star3").html("&starf;");
    $("#star4").html("&starf;");
    $("#star5").html("&starf;");
    $('#rating').val("5");
  });

});
