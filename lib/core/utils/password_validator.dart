


class PasswordValidator {
  static final RegExp _passwordRegExp = RegExp(
    r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$',
  );

  static bool validate(String password) {
    return _passwordRegExp.hasMatch(password);
  }
}

