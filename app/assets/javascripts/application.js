// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

$(function() {
  // manages shopping list buttons
  $(".add-to-list-btn > form").on("ajax:success", function(event, data) {
    $(".shopping-list-container").html(data);
  });

  $(".shopping-list-container").on("ajax:success", ".remove-from-list-btn", function(event, data) {
    $(".shopping-list-container").html(data);
  });

  $(".shopping-list-container").on("ajax:success", ".remove-all-from-list-btn", function(event, data) {
    $(".shopping-list-container").html(data);
  });

  // manages info tabs
  $(".page-view-tabs-container > a").click(function() {
    $(".page-view-tabs-container > a").removeClass("active");
    $(this).addClass("active");
    $(".page-item").hide();
    var href = $(this).attr("href");
    $(href).show();
  });
  // should only click if none of the tabs have been clicked on previously
  // if statement below won't work - page loads w/o '.active' on any tabs
  var hash = window.location.hash;
  if (hash.length) {
    $('.page-view-tabs-container > a[href="' + hash + '"]').click();
  } else {
    $(".page-view-tabs-container > a:first").click();
  };
  //}

  // manages shopping list quantity changes
  $(".change-user-product-quantity").change(function() {
    $(this).closest('form').submit();
  })

  $(".choose-user-product-store").change(function() {
    $(this).closest('form').submit();
  })
})