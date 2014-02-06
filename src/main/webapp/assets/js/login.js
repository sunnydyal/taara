$.validator.setDefaults({
	submitHandler: function() { alert("submitted!"); }
});

$().ready(function() {
	// validate the comment form when it is submitted
  $("#loginForm").validate(
                    {
                      rules: {
                        userName: {
                          required: true,
                          validateName: true,
                          minlength: 2,
                          maxlength: 30
                        },
                        password: {
                          required: true,
                          minlength: 6,
                          maxlength: 16,
                          password: false
                        }
                      },
                      messages: {
                        userName: {
                          required: "Please enter username."
                        },
                        password: {
                          required: "Please provide a password.",
                          minlength: "Your password must be at least 6 characters long."
                        }
                      },
                      errorElement: "div",
                      errorPlacement: function(error, element) {
                        $(element).nextAll('.form_hint').remove();
                        $(element).closest('.form-group').append(
                                $(error).addClass('validation_error'));
                      },
                      onkeyup: function(element) {
                        if ($(element).valid()) {
                          $(element).nextAll('.validation_error').remove();
                        }
                      },
                      onfocusout: function(element) {
                        if ($(element).valid()) {
                          $(element).nextAll('.validation_error').remove();
                        }
                      }
                    });
  
};
