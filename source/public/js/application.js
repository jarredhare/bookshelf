$(document).ready(function() {
var feedbackTemplate= $.trim($('#feedback_template').html());

$('.add').on('click', addFeedback);
$('.feedback_list').on('click', '.delete',removeFeedback);

function removeFeedback(){
  $(this).closest('div').remove();
};

function addFeedback(){
  $feedback = buildFeedback();
  $('.feedback_list').append($feedback);
  clearInput();
}

function clearInput(){
  $('#content').val('');
};

function buildFeedback(){

$feedbackTemplate = $(feedbackTemplate);

date = $('#date').val();
content = $('#content').val();

$feedbackTemplate.find('.date span').text(date);
$feedbackTemplate.find('.content').text(content);

return $feedbackTemplate;

}

});
