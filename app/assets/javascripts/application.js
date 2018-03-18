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
//= require jquery.turbolinks
//= require jquery_ujs
//= require bootstrap
//= require twitter/bootstrap
//= require jquery-1.11.1.min
//= require bootstrap.min
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

  $(".notice_text, .notice, .error").fadeOut(60000, function(){
    $(this).html("");
  });

});

function readURL(input) {
  var validFileExtension = ['jpg', 'JPG', 'jpeg', 'JPEG', 'png', 'PNG', 'gif', 'GIF', 'bmp', 'BMP'];
  if ($.inArray($(input).val().split('.').pop().toLowerCase(), validFileExtension) == -1) {
    swal("Sorry !!! Allowed image formats are '.jpeg','.jpg', '.png', '.gif', '.bmp'");
  }else{

    if (input.files && input.files[0]) {
      var reader = new FileReader();
      reader.onload = function (e) {
        $('#profile-image img')
        .attr('src', e.target.result)
      };
      reader.readAsDataURL(input.files[0]);
      $("#upload-text").remove();
      $("#upload_button").parent(".profile-img-container").after("<div class='h4 white-text text-center' id='upload-text'>Got it! Click update to save image</div>");
    }
  }
}

// gallary js start
function openModal() {
  document.getElementById('myModal').style.display = "block";
}

function closeModal() {
  document.getElementById('myModal').style.display = "none";
}

var slideIndex = 1;
showSlides(slideIndex);

function plusSlides(n) {
  showSlides(slideIndex += n);
}

function currentSlide(n) {
  showSlides(slideIndex = n);
}

function showSlides(n) {
  var i;
  var slides = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("demo");
  var captionText = document.getElementById("caption");
  if (n > slides.length) {slideIndex = 1}
  if (n < 1) {slideIndex = slides.length}
  for (i = 0; i < slides.length; i++) {
      slides[i].style.display = "none";
  }
  for (i = 0; i < dots.length; i++) {
      dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex-1].style.display = "block";
  dots[slideIndex-1].className += " active";
  captionText.innerHTML = dots[slideIndex-1].alt;
}
// gallary js end
//facebook login js//
