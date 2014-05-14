class Event < ActiveRecord::Base
  has_many :event_registrations
  has_many :users, :through => :event_registrations
  
  attr_accessible :name, :short_code, :start_date, :end_date, :description, :notes
  attr_accessible :logo, :logo_delete

  #Paperclip
  has_attached_file :logo, :styles => { :thumb => "100x100>", :medium => "250x250>" },
                    :url  => "/system/images/logos/:class/:style/:id_:basename.:extension"
  validates_attachment_size :logo, :less_than => 5.megabytes
  validates_attachment_content_type :logo, :content_type => ['image/jpeg', 'image/png', 'image/gif']

  def logo_delete
    @logo_delete || '0'
  end

  def logo_delete=(str)
      @logo_delete = str
  end

  private
    def delete_logo
      self.logo.clear if self.logo_delete == '1'
    end
end
