class InfoRequest < ActiveRecord::Base
  validates :contact_id, presence: true
  def save
  end
end
