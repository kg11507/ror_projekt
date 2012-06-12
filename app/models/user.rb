class User < ActiveRecord::Base
  has_many :comments, :dependent=>:delete_all
  has_many :reservations, :dependent=>:delete_all
  has_many :hires, :dependent=>:delete_all
  has_one :user_info, :dependent=>:destroy
  has_and_belongs_to_many :roles
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  
end
