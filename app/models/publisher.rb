class Publisher < ActiveRecord::Base
  validates_presence_of :name
  
  has_many :examples
end
