# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def current_user_is_admin?
    current_user && current_user.is_admin?
  end

end
