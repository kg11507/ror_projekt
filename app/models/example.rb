class Example < ActiveRecord::Base
  validates_presence_of :book, :publisher_id
  
  belongs_to :book
  has_one :reservation, :dependent=>:destroy
  belongs_to :publisher
  has_many :hires, :dependent=>:delete_all
  
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
