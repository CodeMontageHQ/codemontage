class Event < ActiveRecord::Base
  has_many :event_participants
  has_many :users, :through => :event_participants  
end
