import 'package:thai_pdf_fixer/thai_pdf_fixer.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ThaiTextExtension', () {
    test('detects Thai text in mixed content', () {
      expect('ภาษาไทย: ฉันกำลังเขียนภาษาไทยอยู่'.containsThai, isTrue);
      expect('English only'.containsThai, isFalse);
      expect('Invoice 123 — รวม ฿500'.containsThai, isTrue);
    });

    test('keeps readable alias', () {
      expect('ภาษาไทย: ฉันกำลังเขียนภาษาไทยอยู่'.isThaiText, isTrue);
      expect('English only'.isThaiText, isFalse);
    });

    test('strict script-only detection rejects Latin content', () {
      expect('ภาษาไทย'.isThaiOnly, isTrue);
      expect('ภาษาไทย: ฉันกำลังเขียนภาษาไทยอยู่ English'.isThaiOnly, isFalse);
      expect('   '.isThaiOnly, isFalse);
    });
  });
}
