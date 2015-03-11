# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

var hideElement = function(selector) {
  $selector.addClass('hidden');
}

var showElement = function(selector) {
  $(selector).removeClass('hidden');
}

  $('.interest_dropdown').onchange('select', function() {
    #submit any current check box status

    #show interest_music table
    getElementByClass("interest_music").attachEvent("onchange", 
      hideElement('.interest_politics, .interest_physical, .interest_professional')
      showElement('.interest_music')
    )

    #show interest_politics table
    getElementByClass("interest_politics").attachEvent("onchange", 
      hideElement('.interest_music, .interest_physical, .interest_professional')
      showElement('.interest_politics')
    )

    #show interest_physical table
    getElementByClass("interest_physical").attachEvent("onchange", 
      hideElement('.interest_politics, .interest_music, .interest_professional')
      showElement('.interest_physical')
    )

    #show interest_professional table
    getElementByClass("interest_professional").attachEvent("onchange", 
      hideElement('.interest_politics, .interest_physical, .interest_music')
      showElement('.interest_professional')
    )
  })

