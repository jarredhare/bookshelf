get "/books" do
  if params[:search]
    @books = GoogleBooks.search(params[:search], {:count => 5})
    erb :book_search
  else
    erb :search
  end
end

get "/books/:id" do
  @book = Book.find(params[:id])
  erb :book
end

post "/books" do
  book = current_user.books.create(params) if current_user
  book.to_json
end

delete "/books/:id" do
  book = current_user.books.find(params[:id])
  current_user.books.delete(book)
  redirect "/"
end