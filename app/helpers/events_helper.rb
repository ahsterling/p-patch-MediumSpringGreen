module EventsHelper

  def current_user_match
    if current_user
          current_user.id == @event.user_id
    end
  end
end
