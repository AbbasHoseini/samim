

import 'package:flutter_test/flutter_test.dart';
import 'package:samim/core/utils/password_validator.dart';

void main() {
  group('PasswordValidator', () {
    test('Empty password should return an error message', () {
      final result = PasswordValidator.validate('');
      expect(result, 'لطفاً پسورد خود را وارد کنید');
    });

    test('Short password should return an error message', () {
      final result = PasswordValidator.validate('123');
      expect(result, 'پسورد باید بیش از ۸ کاراکتر باشد');
    });

    test('Weak password should return an error message', () {
      final result = PasswordValidator.validate('password');
      expect(result, 'باید از حروف لاتین و حروف بزرگ و کوچک استفاده کنید');
    });

    test('Valid password should return null', () {
      final result = PasswordValidator.validate('StrongPassword1');
      expect(result, null);
    });
  });
}
