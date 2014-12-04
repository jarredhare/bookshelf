$(document).ready(function() {
  $('.add-book').on('click', function(e){
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

  })
});
