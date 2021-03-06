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
//= require jquery
//= require jquery_ujs
//= require bootstrap
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
  $(".select-shopping-list-user-page").on("ajax:success", function(event, data) {
    $(".shopping-list-display").html(data);
  });

  // make navbar buttons appear clicked

  // $(".nav a").click(function(event) {
  //   var href = $(this).attr("href");
  //   $(this).closest("li").addClass("active");
  // });

  // manages info tabs for user, store, and product show
  $(".page-view-tabs-container a").click(function(event) {
    var href = $(this).attr("href");
    // prevents window from scrolling down to start of clicked tab
    event.preventDefault();
    // sets params hash to contain appropriate tab hash
    // window.location.hash = href;
    // removes & adds active class, hides & shows appropriate items
    $(".page-view-tabs-container li").removeClass("active");
    $(this).closest("li").addClass("active");
    $(".page-item").hide();
    $(href).show();
  });
  // clicks on first element for initial page load
  // should only click if none of the tabs have been clicked on previously
  var hash = window.location.hash;
  if (hash.length) {
    $('.page-view-tabs-container a[href="' + hash + '"]').click();
  } else {
    $(".page-view-tabs-container a:first").click();
  }

  // handles all form submission without submit button
  var invisibleSubmit = function(container, submitForm) {
    $(container).on("change", submitForm, function() {
      $(this).closest('form').submit();
    })
  };
  // shopping list item quantity changes
    // on sidebar
  invisibleSubmit(".shopping-list-container", ".change-user-product-quantity > input");
    // on user show page
  invisibleSubmit("#shopping-list-display", ".change-user-product-quantity > input");

  // shopping list item store choice
  invisibleSubmit(".choose-user-product-store");

  // manages shopping list title change
  invisibleSubmit(".shopping-list-container", ".shopping-list-title > input");

  // manages shopping list selection in sidebar and user show page
  invisibleSubmit(".shopping-list-container", ".select-shopping-list");

  invisibleSubmit("#user-shopping-list", ".select-shopping-list-user-page");

  // currently collapses width of siebar when scrolled down
  // $(".shopping-list").affix();
})

