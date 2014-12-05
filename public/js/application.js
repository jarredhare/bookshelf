$(document).ready(function() {
  controller = new Controller
  controller.bindListeners()
});

function Controller() {
}

Controller.prototype.bindListeners = function(){
  $('.add-form').on('click', addBook)
  $('.star').on('click', function(e){
    console.log(e.target)
  })
}

var addBook = function(e){
  e.preventDefault()
  var form = $(this)
  var currentAddButton = form.find('button')
  var book = form.parents().eq(2)
  var book_data = {title: book.find('#title').text(),
                   author: book.find('#author').text(),
                   description: book.find('#description').text(),
                   img_url: book.find('#img_url').attr('src'),
                   isbn: book.find('#isbn').text(),
                   average_rating: book.find('#average_rating').text(),
                   categories: book.find('#categories').text() }
  $.ajax({
    url: "/books",
    type: "post",
    dataType: "json",
    data: book_data
  }).done(function(data){
    currentAddButton.attr("disabled", "disabled")
    currentAddButton.html('Added')
  }).fail(function(){
    console.log("fail!")
  })
}