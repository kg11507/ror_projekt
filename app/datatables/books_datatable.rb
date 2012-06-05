class BooksDatatable
  delegate :params, :h, :link_to, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: Book.count,
      iTotalDisplayRecords: books.total_entries,
      aaData: data
    }
  end

private

  def data
    books.map do |book|
      [
        link_to(book.title, book),
      ]
    end
  end

  def books
    @books ||= fetch_books
  end

  def fetch_books
    books = Book.order("#{sort_column} #{sort_direction}")
    books = books.page(page).per_page(per_page)
    if params[:sSearch].present?
      books = books.where("name like :search or category like :search", search: "%#{params[:sSearch]}%")
    end
    books
  end

  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def sort_column
    columns = %w[title]
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end
end