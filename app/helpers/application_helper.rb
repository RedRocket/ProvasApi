module ApplicationHelper
	def toastr(message, duration)
		render inline: javascript_tag("Materialize.toast('#{message}', #{duration})")
	end

  def states
    return State.order(:name)
  end
end
