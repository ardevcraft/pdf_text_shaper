import 'package:sinhala_pdf_fixer/sinhala_pdf_fixer.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('SinhalaTextExtension', () {
    test('detects Sinhala text in mixed content', () {
      expect('සිංහල: මම සිංහලෙන් ලියනවා.'.containsSinhala, isTrue);
      expect('English only'.containsSinhala, isFalse);
      expect('Invoice 123 — එකතුව රු. 500'.containsSinhala, isTrue);
    });

    test('keeps readable alias', () {
      expect('සිංහල: මම සිංහලෙන් ලියනවා.'.isSinhalaText, isTrue);
      expect('English only'.isSinhalaText, isFalse);
    });

    test('strict script-only detection rejects Latin content', () {
      expect('සිංහල'.isSinhalaOnly, isTrue);
      expect('සිංහල: මම සිංහලෙන් ලියනවා. English'.isSinhalaOnly, isFalse);
      expect('   '.isSinhalaOnly, isFalse);
    });
  });
}
