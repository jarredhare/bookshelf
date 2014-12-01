get "/books" do
  if params[:search]
    books = GoogleBooks.search(params[:search])
    @book = books.first
    erb :book
  else
    erb :search
  end
end