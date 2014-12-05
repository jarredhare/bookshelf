$(document).ready(function() {
  controller = new Controller
  controller.bindListeners()
});

function Controller() {
}

Controller.prototype.bindListeners = function(){
  $('.add-book').on('click', changeAddButton)
}

var changeAddButton = function(e){
  e.preventDefault()
  currentAddButton = $(this)
  $.ajax({
    url: "/books",
    type: "post",
    dataType: "json",
    data: currentAddButton.parent().serialize()
  }).done(function(data){
    currentAddButton.attr("disabled", "disabled")
    currentAddButton.html('Added')
  }).fail(function(){
    console.log("fail!")
  })
}