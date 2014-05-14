class Event < ActiveRecord::Base
  has_many :event_registrations
  has_many :users, :through => :event_registrations
  
  attr_accessible :name, :short_code, :start_date, :end_date, :description, :notes
end
