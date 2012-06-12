class Hire < ActiveRecord::Base
  belongs_to :example
  belongs_to :user
  has_one :reservation, :dependent=>:destroy
  
  def return_status
    if(return_date!=nil)
      return return_date.strftime("%d-%m-%Y")
    end
    return '---'
  end
  
end
