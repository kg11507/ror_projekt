class BookGenresController < ApplicationController
  before_filter :authenticate_user!, :only => [ :new, :edit, :update, :destroy]
  # GET /book_genres
  # GET /book_genres.json
  def index
    @book_genres = BookGenre.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @book_genres }
    end
  end

  # GET /book_genres/1
  # GET /book_genres/1.json
  def show
    @book_genre = BookGenre.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @book_genre }
    end
  end

  # GET /book_genres/new
  # GET /book_genres/new.json
  def new
    @book_genre = BookGenre.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @book_genre }
    end
  end

  # GET /book_genres/1/edit
  def edit
    @book_genre = BookGenre.find(params[:id])
  end

  # POST /book_genres
  # POST /book_genres.json
  def create
    @book_genre = BookGenre.new(params[:book_genre])

    respond_to do |format|
      if @book_genre.save
        format.html { redirect_to @book_genre, notice: 'Book genre was successfully created.' }
        format.json { render json: @book_genre, status: :created, location: @book_genre }
      else
        format.html { render action: "new" }
        format.json { render json: @book_genre.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /book_genres/1
  # PUT /book_genres/1.json
  def update
    @book_genre = BookGenre.find(params[:id])

    respond_to do |format|
      if @book_genre.update_attributes(params[:book_genre])
        format.html { redirect_to @book_genre, notice: 'Book genre was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @book_genre.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /book_genres/1
  # DELETE /book_genres/1.json
  def destroy
    @book_genre = BookGenre.find(params[:id])
    @book_genre.destroy

    respond_to do |format|
      format.html { redirect_to book_genres_url }
      format.json { head :ok }
    end
  end
end
