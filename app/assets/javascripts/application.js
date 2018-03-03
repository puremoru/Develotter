// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require jquery3
//= require popper
//= require bootstrap-sprockets
// $(window).on('load',function(){
//
//     $(window).scroll(function (){
//         $('.fade-in').each(function(){
//             var POS = $(this).offset().top;
//             var scroll = $(window).scrollTop();
//             var windowHeight = $(window).height();
//
//             if (scroll > POS - windowHeight + windowHeight/3){
//                 $(this).css("opacity","1" );
//             } else {
//                 $(this).css("opacity","0" );
//             }
//         });
//     });
// });

$(window).on('load',function(){
  $(window).scroll(function (){
          $('.fade-in').each(function(){
              var POS = $(this).offset().top;
              var scroll = $(window).scrollTop();
              var windowHeight = $(window).height();

              if (scroll > POS - windowHeight + windowHeight/3){
                  $(this).css("opacity","1" );
              } else {
                  $(this).css("opacity","0" );
              }
          });
      });

    $(window).scroll(function (){
        $('.fade-up').each(function(){
            var POS = $(this).offset().top;
            var scroll = $(window).scrollTop();
            var windowHeight = $(window).height();

            if (scroll > POS - windowHeight){
                $(this).css({
                        'opacity':'1',
                        'transform':'translateY(0)',
                        '-webkit-transform':'translateY(0)',
                        '-moz-transform':'translateY(0)',
                        '-ms-transform':'translateY(0)'
                });
            } else {
                $(this).css({
                        'opacity':'0',
                        'transform':'translateY(70px)',
                        '-webkit-transform':'translateY(70px)',
                        '-moz-transform':'translateY(70px)',
                        '-ms-transform':'translateY(70px)'
                });
            }
        });
    });
});

// 文字数のカウント
$(function () {
  $("#about-textarea").keyup(function(){
    var counter = $(this).val().length;
    $("#countUp").text(counter);

    if(counter == 0){
      $("#countUp").text("0");
    }
    if(counter >= 200){
      $("#countUp").css("color","red");
    } else {
      $("#countUp").css("color","#666");
    }
  });
});
