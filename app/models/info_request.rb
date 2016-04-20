class InfoRequest < ActiveRecord::Base
  belongs_to :contact
  #validates :contact_id, presence: true
  #def save
  #end
end
