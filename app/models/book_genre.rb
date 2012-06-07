class BookGenre < ActiveRecord::Base
  has_many :books
end
