class Reservation < ActiveRecord::Base
  belongs_to :example
  belongs_to :user
end
