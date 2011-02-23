function eventForSelectorHandler(selector, eventType) {
  var lives = jQuery.data(document, "events").live;
  for (var i = 0; i < lives.length; i++) {
    var live = lives[i];
    if ($(selector).is(live.selector)) {
      var event = $.Event(eventType);
      live.handler.call($(selector)[0], event);
      return event;
    }
  }
}

beforeEach(function() {
  this.addMatchers({
    toBeATextInput: function() {
      return this.actual.is(":text");
    },

    toBeDefaultPrevented: function() {
      return this.actual.isDefaultPrevented();                    
    },

    toBeHidden: function() {
      return this.actual.is(":hidden");             
    },

    toBeVisible: function() {
      return this.actual.is(":visible");             
    },

    toHaveClass: function(className) {
      return this.actual.hasClass(className);             
    }
  });
});

