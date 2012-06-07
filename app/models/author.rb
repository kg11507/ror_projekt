class Author < ActiveRecord::Base
  validates_presence_of :name, :surname
  
  has_many :books
  has_many :comments, :as => :subject
  
  def popularity
    counter = 0
    books.each do |b|
      counter += b.popularity
    end
    return counter
  end
  
end
