import 'package:arabic_pdf_fixer/arabic_pdf_fixer.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ArabicTextExtension', () {
    test('detects Arabic text in mixed content', () {
      expect('العربية: أنا أكتب باللغة العربية.'.containsArabic, isTrue);
      expect('English only'.containsArabic, isFalse);
      expect('Invoice 123 — الإجمالي 500'.containsArabic, isTrue);
    });

    test('keeps readable alias', () {
      expect('العربية: أنا أكتب باللغة العربية.'.isArabicText, isTrue);
      expect('English only'.isArabicText, isFalse);
    });

    test('strict script-only detection rejects Latin content', () {
      expect(
        'مرحبا بالعالم التعليم الطالب الاختبار والإعلان'.isArabicOnly,
        isTrue,
      );
      expect('العربية: أنا أكتب باللغة العربية. English'.isArabicOnly, isFalse);
      expect('   '.isArabicOnly, isFalse);
    });
  });
}
