module ApplicationHelper

  def action_button(membership)
    membership.role == "pending" ? "approve" : "remove"
  end

end
