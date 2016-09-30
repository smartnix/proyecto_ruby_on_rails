
$(document).on "ajax:success", "form#comments-form", (ev,data)->
	console.log data
	$(this).find("text-area").val("")
	$("#comments-box").append("<p>#{data.body} - #{data.user.email}</p>")

$(document).on "ajax:error", "form#comments-form", (ev,data)->
	console.log data



