// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require rails-ujs
//= require turbolinks
//= require bootstrap
//= require_tree .

$(function() {

  addEventListener("load", function() {
    setTimeout(hideURLbar, 0);
  }, false);

  function hideURLbar(){
    window.scrollTo(0,1);
  }

  $(".scroll").click(function(event){
    event.preventDefault();
    $('html,body').animate({
      scrollTop:$(this.hash).offset().top
    },1000);
  });

  //$().UItoTop({ easingType: 'easeOutQuart' });

  $('.popup-with-zoom-anim').magnificPopup({
    type: 'inline',
    fixedContentPos: false,
    fixedBgPos: true,
    overflowY: 'auto',
    closeBtnInside: true,
    preloader: false,
    midClick: true,
    removalDelay: 300,
    mainClass: 'my-mfp-zoom-in'
  });

  $('.cm-overlay').cmOverlay();
  $('.example1').wmuSlider();

  size_li = $("#myList li").size();
  x=1;
  $('#myList li:lt('+x+')').show();
  $('#loadMore').click(function () {
    x= (x+1 <= size_li) ? x+1 : size_li;
    $('#myList li:lt('+x+')').show();
  });
  $('#showLess').click(function () {
    x=(x-1<0) ? 1 : x-1;
    $('#myList li').not(':lt('+x+')').hide();
  });

});
