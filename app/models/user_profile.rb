class UserProfile < ActiveRecord::Base
  belongs_to :user
  attr_accessible :gravatar_email, :headline, :is_coder, :name, :represents_org, :represents_team
end
