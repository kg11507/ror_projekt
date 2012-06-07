class Book < ActiveRecord::Base
  validates_presence_of :title, :author, :book_genre
  
  belongs_to :author
  belongs_to :book_genre
  
  has_many :comments, :as => :subject
  has_many :examples  
  
  def available?
    if(examples.count>0)
      examples.each do |e|
        if(e.reservation!=nil)
          return false
        end
        e.hires.each do |h|
          if(h.return_status!=false)
            return false
          end
        end
      end
      return true
    else
      return false
    end
  end
  
  def self.get_selector_content
    @books = Book.all.map do |book|
      [book.title, book.id]
    end
  end
  
  def popularity
    counter=0
    examples.each do |e|
      if e.hires!=nil
        counter += e.hires.count
      end
    end
    return counter
  end
  
end
