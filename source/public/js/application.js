$(document).ready(function() {
  $('form').on('submit',function(e) {
    e.preventDefault();
    var data = $(this).serialize();
    // debugger;
    $.ajax({
      type: this.method,
      url: this.action,
      data: data,
    }).done(function(server_data) {
      console.log("Success -- server returned: " + server_data);
      // $('newworkout').html(server_data);
      $("form").html(server_data);
    }).fail(function(errorThrown){
      console.log("Error -- " + errorThrown);
    });
  });
  });









// var feedbackTemplate= $.trim($('#feedback_template').html());

// $('.add').on('click', addFeedback);
// $('.feedback_list').on('click', '.delete',removeFeedback);

// function removeFeedback(){
//   $(this).closest('div').remove();
// };

// function addFeedback(){
//   $feedback = buildFeedback();
//   $('.feedback_list').append($feedback);
//   clearInput();
// }

// function clearInput(){
//   $('#content').val('');
// };

// function buildFeedback(){
//   $feedbackTemplate = $(feedbackTemplate);

//   date = $('#date').val();
//   content = $('#content').val();

//   $feedbackTemplate.find('.date span').text(date);
//   $feedbackTemplate.find('.content').text(content);

//   return $feedbackTemplate;
//   }

  // });


