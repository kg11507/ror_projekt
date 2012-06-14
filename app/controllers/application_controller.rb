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
      tmp = session[:return_to]
      if tmp==nil
        redirect_to "/perm.html"
      else
        redirect_to tmp, notice: 'You don\'t have permission.'
      end
    end
  end
  
  def my_authenticate?
#    puts "yyy "
    if(current_user!=nil && current_user.admin)
      return
    end
    if params[:id]!=nil
#      puts "zzz "+params[:id]
      instance=@@model.find(params[:id])
      #      puts "zzz "+instance.to_s+" "+instance.user_id.to_s
      #      //if(instance.methods.include? :user_id && true)

        (user_id = instance.user_id )rescue nil

#      (puts "xxx "+user_id.to_s+" "+current_user.id.to_s )rescue nil
      if(user_id!=nil && user_id!=current_user.id)
        redirect_to "/perm.html"
      end
    end
  end
  
def back
  redirect_to session[:return_to]
end
  
end
