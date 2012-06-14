class UserInfosController < ApplicationController
  before_filter :authenticate_user!, :only => [ :new, :edit, :update, :destroy, :show]
  before_filter :admin?, :only => [ :new, :destroy, :index] 
  before_filter :my_panel?, :only => [ :show, :edit] 
  @@model=UserInfo
  
  # GET /user_infos
  # GET /user_infos.json
  def index
    @user_infos = UserInfo.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @user_infos }
    end
  end

  # GET /user_infos/1
  # GET /user_infos/1.json
  def show
    id=params[:id]
    if id==nil
      id=current_user.id
    end
    @user_info = UserInfo.find(id)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user_info }
    end
  end
  
  def my_panel
    if(current_user==nil)
      redirect_to "/users/sign_in", notice: 'Login first.'
      return 
    end
    @user_info = User.find(current_user.id).user_info
    
    respond_to do |format|
      format.html {redirect_to @user_info}
      ## show.html.erb
      format.json { render json: @user_info }
    end
  end

  # GET /user_infos/new
  # GET /user_infos/new.json
  def new
    @user_info = UserInfo.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user_info }
    end
  end

  # GET /user_infos/1/edit
  def edit
    @user_info = UserInfo.find(params[:id])
  end

  # POST /user_infos
  # POST /user_infos.json
  def create
    @user_info = UserInfo.new(params[:user_info])

    respond_to do |format|
      if @user_info.save
        format.html { redirect_to @user_info, notice: 'User info was successfully created.' }
        format.json { render json: @user_info, status: :created, location: @user_info }
      else
        format.html { render action: "new" }
        format.json { render json: @user_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /user_infos/1
  # PUT /user_infos/1.json
  def update
    @user_info = UserInfo.find(params[:id])

    respond_to do |format|
      if @user_info.update_attributes(params[:user_info])
        format.html { redirect_to @user_info, notice: 'User info was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @user_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_infos/1
  # DELETE /user_infos/1.json
  def destroy
    @user_info = UserInfo.find(params[:id])
    @user_info.destroy

    respond_to do |format|
      format.html { redirect_to user_infos_url }
      format.json { head :ok }
    end
  end
  
  def my_panel?
    if(current_user!=nil && current_user.admin)
      return
    end
    @user_info = UserInfo.find(params[:id])
    if(@user_info.id!=current_user.user_info.id)
      redirect_to "/perm.html"
      return
    end
  end
  
end
