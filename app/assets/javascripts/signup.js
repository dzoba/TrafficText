$(document).ready(function() {

  $('form#sign_up').bind('ajax:success', function(e, data, status, xhr) {
    console.log(data);
    if(data.success) {
      $('#user_signup_box').html(data.content);
      alert("ajax return");
    } else {
      $('#user_signup_box').prepend(data.errors.join('<br />'));
            alert("ajax return");
    }
  });

});
