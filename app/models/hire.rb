class Hire < ActiveRecord::Base
  belongs_to :example
  belongs_to :user
  has_one :reservation
  
  def return_status
    if(return_date!=nil)
      return return_date
    end
    return false
  end
  
end