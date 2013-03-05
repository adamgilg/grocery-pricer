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
  // looks for a 'form' within s-l-c because all forms within it are reloaded after original page load
  $(".shopping-list-container").on("ajax:success", "form", function(event, data) {
    $(".shopping-list-container").html(data);
  });

  // switches chosen list on user show page - doesn't currently work
  // console.log($('.select-shopping-list'));
  $(".select-list-user-page").on("ajax:success", function(event, data) {
    $(".shopping-list-display").html(data);
  });

  // $(".shopping-list-container").on("ajax:success", ".remove-all-from-list-btn", function(event, data) {
  //   $(".shopping-list-container").html(data);
  // });

  // manages info tabs
  $(".page-view-tabs-container > a").click(function() {
    $(".page-view-tabs-container > a").removeClass("active");
    $(this).addClass("active");
    $(".page-item").hide();
    var href = $(this).attr("href");
    $(href).show();
  });
  // should only click if none of the tabs have been clicked on previously
  var hash = window.location.hash;
  if (hash.length) {
    $('.page-view-tabs-container > a[href="' + hash + '"]').click();
  } else {
    $(".page-view-tabs-container > a:first").click();
  }

  // handles all form submission without buttons
  // replaces very repetitive code doing this same thing
  var invisibleSubmit = function(container, submitForm) {
    $(container).on("change", submitForm, function() {
      $(this).closest('form').submit();
    })
  }
  // shopping list item quantity changes
  invisibleSubmit(".shopping-list-container", ".change-user-product-quantity > input");
  // $(".shopping-list-container").on("change", ".change-user-product-quantity > input", function() {
  //   $(this).closest('form').submit();
  // });

  // shopping list item store choice
  invisibleSubmit(".choose-user-product-store");
  // $(".choose-user-product-store").change(function() {
  //   $(this).closest('form').submit();
  // });

  // manages shopping list title change
  invisibleSubmit(".shopping-list-container", ".shopping-list-title > input");
  // $(".shopping-list-container").on("change", ".shopping-list-title > input", function() {
  //   $(this).closest('form').submit();
  // });

  // manages shopping list selection in sidebar and user show page
  invisibleSubmit(".shopping-list-container", ".select-shopping-list");
  // $(".shopping-list-container").on("change", ".select-shopping-list", function() {
  //   $(this).closest("form").submit();
  // });

  invisibleSubmit("#user-shopping-list", ".select-shopping-list");
  // $("#user-shopping-list").on("change", ".select-shopping-list", function() {
  //   $(this).closest("form").submit();
  // });
})