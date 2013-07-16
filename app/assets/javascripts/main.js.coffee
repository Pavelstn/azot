# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$(document).ready ->
	#$(".click_link").live "click", ->
	#	my_ajax_send "/userapi/dealclick/" + $(this).attr("id"), "", ""
	$(".click_link").mousedown ->
		my_ajax_send "/userapi/dealclick/" + $(this).attr("id"), "", ""


