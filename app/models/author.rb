class Author < ActiveRecord::Base
  validates_presence_of :name, :surname
  
  has_many :books, :dependent=>:delete_all
  has_many :comments, :as => :subject, :dependent=>:delete_all
  
  def popularity
    counter = 0
    books.each do |b|
      counter += b.popularity
    end
    return counter
  end
  
end
