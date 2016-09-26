
$(document).on "ajax:success", "form#comments-form", (ev,data)->
	console.log data
	$(this).find("text-area").val("")
	$("#comments-box").append("<li> #{data.body} - #{data.user.email}</li>")

$(document).on "ajax:error", "form#comments-form", (ev,data)->
	console.log data



