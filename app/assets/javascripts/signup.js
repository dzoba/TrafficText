$(document).ready(function() {

  $('form#sign_up').bind('ajax:success', function(e, data, status, xhr) {
    console.log(data);
    if(data.success) {
      $('#user_signup_box').html(data.content);
      document.forms["new_alert"].submit();
    } else {
      $('#user_signup_box').prepend(data.errors.join('<br />'));
    }
  });

});
