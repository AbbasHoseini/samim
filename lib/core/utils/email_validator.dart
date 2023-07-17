class EmailValidator {
  static final RegExp _emailRegExp = RegExp(
    r'^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$',
  );

  static validate(String email) {
    if (email.isEmpty) {
      return 'لطفا ایمیل خود را وارد کنید';
    } else if (!_emailRegExp.hasMatch(email)) {
      return 'لطفا ایمیل معتبر وارد کنید';
    }
    return null;
  }
}
