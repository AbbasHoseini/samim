

import 'package:flutter_test/flutter_test.dart';
import 'package:samim/core/utils/email_validator.dart';

void main() {
  group('EmailValidator', () {
    test('Empty email should return an error message', () {
      final result = EmailValidator.validate('');
      expect(result, 'لطفا ایمیل خود را وارد کنید');
    });

    test('Invalid email should return an error message', () {
      final result = EmailValidator.validate('hahaha');
      expect(result, 'لطفا ایمیل معتبر وارد کنید');
    });

    test('Valid email should return null', () {
      final result = EmailValidator.validate('abbashoseini.ir@email.com');
      expect(result, null);
    });
  });
}
