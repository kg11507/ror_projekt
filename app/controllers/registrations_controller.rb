class RegistrationsController < Devise::RegistrationsController
  def new
    super
  end

  def create
    super
    u=User.last
    if(u!=nil)
      if(u.email.include?('admin'))
        u.admin=true
        u.save
      end
      ui=UserInfo.new
      ui.nickname=u.email
      ui.user=u
      ui.save
    end
  end

  def update
    super
  end
end