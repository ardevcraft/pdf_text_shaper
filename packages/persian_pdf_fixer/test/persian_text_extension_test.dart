import 'package:persian_pdf_fixer/persian_pdf_fixer.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('PersianTextExtension', () {
    test('detects Persian text in mixed content', () {
      expect('فارسی: من به زبان فارسی می‌نویسم.'.containsPersian, isTrue);
      expect('English only'.containsPersian, isFalse);
      expect('Invoice 123 — مبلغ ۵۰۰'.containsPersian, isTrue);
    });

    test('keeps readable alias', () {
      expect('فارسی: من به زبان فارسی می‌نویسم.'.isPersianText, isTrue);
      expect('English only'.isPersianText, isFalse);
    });

    test('strict script-only detection rejects Latin content', () {
      expect(
        'سلام دنیا دانش‌آموز کتابخانه آزمون شماره پرداخت ۱۲۳۴۵'.isPersianOnly,
        isTrue,
      );
      expect(
        'فارسی: من به زبان فارسی می‌نویسم. English'.isPersianOnly,
        isFalse,
      );
      expect('   '.isPersianOnly, isFalse);
    });
  });
}
