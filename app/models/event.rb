class Event < ActiveRecord::Base
  belongs_to :user
  has_many :comments, :as => :subject, :dependent=>:delete_all
end
