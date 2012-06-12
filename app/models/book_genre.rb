class BookGenre < ActiveRecord::Base
  has_many :books, :dependent=>:delete_all
end
