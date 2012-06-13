class ApplicationController < ActionController::Base
  before_filter :authenticate_user!, :only => [ :new, :edit, :update, :destroy]
  before_filter :my_authenticate? , :only => [ :new, :edit, :update, :destroy]
  before_filter :set_return_path, :only => [ :new, :edit, :update, :destroy, :show, :index, :reserve, :unreserve]
  protect_from_forgery
  
  @@model=nil
  
  def set_return_path
    session[:return_to] = request.referer
  end
  
  def admin?
    if current_user!=nil && current_user.admin
      true
    else
      redirect_to publishers_url, notice: 'You don\'t have permission.'
    end
  end
  
  def my_authenticate?
    if params[:id]!=nil
      instance=@@model.find(params[:id])
      if(instance.methods.include? :user_id)
        user_id = instance.user_id
        if(user_id!=nil && user_id!=current_user.id)
          redirect_to session[:return_to], notice: 'You don\'t have permission.'
        end
      end
    end
  end
  
  def back
    redirect_to session[:return_to]
  end
  
end
