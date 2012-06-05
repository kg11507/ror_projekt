class Reservation < ActiveRecord::Base
  belongs_to :example
  belongs_to :user
  belongs_to :hire
  
  def is_active?
    if (canceled || hire!=nil)
      return false
    else 
      if is_old
        return false
      end
    end
    return true
  end
  
  def is_old
    return false
  end
  
end
