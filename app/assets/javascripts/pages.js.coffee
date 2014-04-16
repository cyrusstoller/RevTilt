# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

ready = ->
	$("label[data-error]").parent().addClass("has-error")
	$("input[data-error]").parent().addClass("has-error")
	$("textarea[data-error]").parent().addClass("has-error")
	$(".with_popover").popover()
	$(".disabled").click (e) ->
		e.preventDefault()

$(document).ready(ready)
$(document).on('page:load', ready)
