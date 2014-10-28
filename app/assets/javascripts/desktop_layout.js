$(function() {
  var resizeContainer = function() {
    var parentHeight = $(window).height() - $('.header').outerHeight();
    $('#main-contain').css({height: parentHeight + 'px'});
  };
  var toggleChat = function() {
    $('.chat-contain').toggleClass('active');
  };
  var alignHiders = function() {
    var minAllLeft = $('.min-all').outerWidth();
    var minAllTop = $('.min-all').outerHeight();
    var newLeft = minAllLeft + 5 + 'px';
    var newTop = minAllTop + 5 + 'px';
    $('.chat-hider').css({'right': newLeft});
    $('.task-hider').css({'bottom': newTop});
  };


  var chatToggleButton = $('.toggle-chat');
  chatToggleButton.click(function() {
    toggleChat();
  });
  $('.chat-hider').click(function() {
    toggleChat();
  });
  $('.min-all').click(function() {
    $('.chat-contain').removeClass('active');
  }); 

  // Call resizeContainer when window is resized
  $(window).resize(resizeContainer);
  $(window).resize(alignHiders);
  // Call it now too (on load)
  resizeContainer();
  alignHiders();



});