class ExamplesController < ApplicationController
  before_filter :authenticate_user!, :only => [ :new, :edit, :update, :destroy]
  before_filter :find_publishers, :only => [:new, :edit, :update, :create]
  
  # GET /examples
  # GET /examples.json
  def index
    @examples = Example.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @examples }
    end
  end

  # GET /examples/1
  # GET /examples/1.json
  def show
    @example = Example.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @example }
    end
  end

  # GET /examples/new
  # GET /examples/new.json
  def new
    session[:return_to] ||= request.referer
    @example = Example.new
    @example.book_id = params[:book_id]

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @example }
    end
  end

  # GET /examples/1/edit
  def edit
    @example = Example.find(params[:id])
  end

  # POST /examples
  # POST /examples.json
  def create
    @example = Example.new(params[:example])

    respond_to do |format|
      if @example.save
        format.html { redirect_to session[:return_to], notice: 'Example was successfully created.' }
        format.json { render json: @example, status: :created, location: @example }
      else
        format.html { render action: "new" }
        format.json { render json: @example.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /examples/1
  # PUT /examples/1.json
  def update
    @example = Example.find(params[:id])

    respond_to do |format|
      if @example.update_attributes(params[:example])
        format.html { redirect_to @example, notice: 'Example was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @example.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /examples/1
  # DELETE /examples/1.json
  def destroy
    @example = Example.find(params[:id])
    @example.destroy

    respond_to do |format|
      format.html { redirect_to examples_url }
      format.json { head :ok }
    end
  end
  
  def reserve
    session[:return_to] ||= request.referer
    Reservation.create({:example_id=>params[:id], :user_id=>current_user.id})
    respond_to do |format|
      format.html { redirect_to session[:return_to], notice: 'Reservation successful.'}
      format.json { head :ok }
    end
  end
  
  def unreserve
    session[:return_to] ||= request.referer
    @reservation = Reservation.where(params[:example_id], :user_id=>current_user.id).first
    @reservation.destroy
    respond_to do |format|
      format.html { redirect_to session[:return_to], notice: 'Reservation canceled.'}
      format.json { head :ok }
    end
  end
  
  private
  def find_publishers
    @publishers = Publisher.find(:all).map do |publisher|
      [publisher.name]
    end
  end
   
end
