class Ping < ActiveRecord::Base
  validates :msg_type, presence: true
end
