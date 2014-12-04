helpers do
  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end

  def user_has_book(isbn)
    !!current_user.books.find_by_isbn(isbn)
  end
end