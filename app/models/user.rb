class User < ActiveRecord::Base
  has_many :comments
  has_many :reservations
  has_one :user_info
  has_and_belongs_to_many :roles
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  
  ROLES = %w[admin moderator author]
  
  def role?(role)
    return false
  end
end
