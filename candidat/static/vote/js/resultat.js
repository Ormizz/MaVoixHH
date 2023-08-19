var time = 250;
$(document).ready(function() {
  $('.js-podium').each(function(){
    var t = $(this);
    setTimeout( function(){ 
    t.addClass('is-visible');
    var h = t.data('height');
    console.log(h);
    t.find('.podium-base').css('height', h).addClass('is-expanding');
      }, time);
     time += 250;
  });
})