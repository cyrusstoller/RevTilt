# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

@unfavorite_button_hover = () ->
	$(".unfavorite.btn").hover(
		() -> 
			$(this).find(".default").addClass("hide")
			$(this).find(".hover").removeClass("hide")
			$(this).removeClass("btn-success")
			$(this).addClass("btn-danger")
		,
		() -> 
			$(this).find(".default").removeClass("hide")
			$(this).find(".hover").addClass("hide")
			$(this).removeClass("btn-danger")
			$(this).addClass("btn-success")
	)

$(document).ready(unfavorite_button_hover)
$(document).on('page:load', unfavorite_button_hover)
