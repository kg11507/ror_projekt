class Example < ActiveRecord::Base
  belongs_to :book
  has_one :reservation
  belongs_to :publisher
  has_many :hires
  
  def get_state
    if(reservation!=nil)
      if(reservation.user_id==1)
        return "Already reserved"
      else
        return "unavailable"
      end
    end
    return "available"
  end
  
end
