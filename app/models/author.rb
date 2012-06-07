class Author < ActiveRecord::Base
  validates_presence_of :name, :surname
  
  has_many :books
  has_many :comments, :as => :subject
end
