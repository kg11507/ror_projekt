class BooksController < ApplicationController
  before_filter :find_authors, :find_book_genres, :only => [:new, :edit, :update, :create]
  before_filter :admin?, :only => [ :new, :edit, :update, :destroy] 
  
  @@model=Book
  
  # GET /books
  # GET /books.json
  def index
    #    @books = Book.all
    @books = Book.paginate(:page => params[:page], :per_page=>10)

    respond_to do |format|
      format.html # index.html.erb
      #      format.json { render :json => @books}
      format.json { render :json => BooksDatatable.new(view_context)}
    end
  end

  # GET /books/1
  # GET /books/1.json
  def show
    @book = Book.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @book }
    end
  end

  # GET /books/new
  # GET /books/new.json
  def new
    @book = Book.new
    @book.author_id=params[:author_id]
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @book }
    end
  end

  # GET /books/1/edit
  def edit
    @book = Book.find(params[:id])
  end

  # POST /books
  # POST /books.json
  def create
    @book = Book.new(params[:book])

    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, :notice => 'Book was successfully created.' }
        format.json { render :json => @book, :status => :created, :location => @book }
      else
        format.html { render :action => "new" }
        format.json { render :json => @book.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /books/1
  # PUT /books/1.json
  def update
    @book = Book.find(params[:id])

    respond_to do |format|
      if @book.update_attributes(params[:book])
        format.html { redirect_to book_url, :notice => 'Book was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @book.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    @book = Book.find(params[:id])
    @book.destroy

    respond_to do |format|
      format.html { redirect_to books_url }
      format.json { head :ok }
    end
  end
  
  
  protected
  def find_authors
    @authors = Author.find(:all).map do |author|
      [author.name + " "+ author.surname, author.id]
    end
  end
  
  def find_book_genres
    @book_genres = BookGenre.find(:all).map do |book_genre|
      [book_genre.name, book_genre.id]
    end
  end

end
