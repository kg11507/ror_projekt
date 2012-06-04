class Book < ActiveRecord::Base
  validates_presence_of :title, :author
  validates_uniqueness_of :title
  belongs_to :author
  has_many :comments, :as => :subject
  has_many :examples  
  
  def available?
    if(examples.count>0)
      examples.each do |e|
        if(e.reservation!=nil)
          return false
        end
      end
    end
    return true
  end
end
