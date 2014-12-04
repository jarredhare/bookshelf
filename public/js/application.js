$(document).ready(function() {
  $('.add-book').on('click', function(e){
    e.preventDefault()
    currentAddButton = $(this)

    $.ajax({
      url: "/books",
      type: "post",
      data: currentAddButton.parent().serialize()
    })

  })
});
