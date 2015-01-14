class EventRegistration < ActiveRecord::Base
  belongs_to :event
  belongs_to :user

  attr_accessible :event_id, :user_id

  def github_stat_args
    if user.has_github
      uid = user.services.find_by_provider(:github).uid

      { user:      Github.get_user_login_by_uid(uid),
        day_begin: event.start_date,
        day_end:   event.end_date }
    else
      nil
    end
  end
end
