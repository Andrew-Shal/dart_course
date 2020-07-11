import 'package:email_validator/email_validator.dart';

class ValidationMixin {
  // ignore: missing_return
  String validatePassword(String password) {
    if (password.isEmpty) return 'Password is required';
    if (password.length < 6)
      return 'Minimum length of 6 characters is required';
    return null;
  }

  // ignore: missing_return
  String validateEmail(String email) {
    if (email.isEmpty) return 'Email is required';
    if (!EmailValidator.validate(email)) return 'Enter a valid email';
    return null;
  }
}
