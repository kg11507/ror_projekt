class RegistrationsController < Devise::RegistrationsController
  def new
    super
  end

  def create
    super
    u=User.last
    ui=UserInfo.new
    ui.nickname=u.email
    ui.user=u
    ui.save
  end

  def update
    super
  end
end