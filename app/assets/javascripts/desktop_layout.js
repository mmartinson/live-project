(function(){
  var resizeContainer = function() {
    var parentHeight = $(window).height() - $('.header').outerHeight();
    $('.main-contain').css({height: parentHeight + 'px'});
  };
  var toggleChat = function() {
    $('chat-contain').css({display: block});
  };


  $(function() {
  // Call resizeContainer when window is resized
  $(window).resize(resizeContainer);
  // Call it now too (on load)
  resizeContainer();
  // alert('gg')
  });

  var chatToggleButton = $('#toogle-chat');
  chatToggleButton.on('click', function() {

  });



})();



