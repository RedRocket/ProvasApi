module ApplicationHelper
	def toastr(message, duration)
		render inline: javascript_tag("Materialize.toast('#{message}', #{duration})")
	end
end
