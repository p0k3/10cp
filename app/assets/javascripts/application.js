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
//= require jquery.linky.js
//= require bootstrap
//= require cocoon
//= require toastr
//= require votes
//= require advices
//= require facebook
//= require masonry/jquery.masonry
//= require_self

$(document).ready(function(){
  $('.subject').click(function(){
    url = $(this).attr('data-url');
    document.location.href = url;
  });
  $('.theme').click(function(){
    url = $(this).attr('data-url');
    document.location.href = url;
  });
  $('.best-users .user').click(function(){
    url = $(this).attr('data-url');
    document.location.href = url;
  });
});