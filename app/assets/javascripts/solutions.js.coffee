# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
	$('#solutions').imagesLoaded ->
		$('#solutions').masonry
			itemSelector: '.box'
			isFitWidth: true