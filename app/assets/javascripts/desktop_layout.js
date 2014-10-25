$(function() {
  var resizeContainer = function() {
    var parentHeight = $(window).height() - $('.header').outerHeight();
    $('#main-contain').css({height: parentHeight + 'px'});
  };
  var toggleChat = function() {
    $('.chat-contain').toggleClass('active');
  };


  var chatToggleButton = $('.toggle-chat');
  chatToggleButton.click(function() {
    toggleChat();
  });

  // Call resizeContainer when window is resized
  $(window).resize(resizeContainer);
  // Call it now too (on load)
  resizeContainer();

});