class PasswordValidator {
  static final RegExp _passwordRegExp = RegExp(
    r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$',
  );

  static validate(String password) {
    if (password.isEmpty) {
      return 'لطفاً پسورد خود را وارد کنید';
    }
    if (password.length < 8) {
      return 'پسورد باید بیش از ۸ کاراکتر باشد';
    }
    if (!_passwordRegExp.hasMatch(password)) {
      return 'باید از حروف لاتین و حروف بزرگ و کوچک استفاده کنید';
    }
    return null;
  }
}
