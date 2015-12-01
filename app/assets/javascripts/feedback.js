$(document).ready(function() {
  $(window).on('load', disableFeedBackPanel)

});

  function disableFeedBackPanel() {
    var posted_items = $('.item-thumbnail');
    for (var i = 0; i < posted_items.length; i++) {
      var panel = posted_items[i]
      var spanCounts = $(panel).find('.margin-spacer span');
      for(var j = 0; j < spanCounts.length; j++) {
        if (spanCounts[j].innerText > 0) {
          var btnGroup = spanCounts.closest(".feedback-button-group");
          btnGroup.children().each(function(){
            $(this).addClass('notEnabled');
          });
        };
      }
    }
  };
