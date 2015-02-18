class UserEngagedProject < ActiveRecord::Base
  belongs_to :user

  attr_accessible :engagement_type, :github_created_at, :project_github_url,
                  :user_id
end
