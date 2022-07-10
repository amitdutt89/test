togglePassword = function () {
  if ($("#user_password").attr('type') === "password") {
      $("#user_password").attr('type', 'text');
  } else {
      $("#user_password").attr('type', 'password');
  }
}
