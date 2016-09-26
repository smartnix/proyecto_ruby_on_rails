
$(document).on "ajax:success", "form#comments-form", (ev,data)->
	console.log data
$("#comments-box").append("<li> #{data-type.body} </li>")

$(document).on "ajax:error", "form#comments-form", (ev,data)->
	console.log data



