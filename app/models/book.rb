class Book < ActiveRecord::Base
  validates_presence_of :title, :author
  validates_uniqueness_of :title
end
