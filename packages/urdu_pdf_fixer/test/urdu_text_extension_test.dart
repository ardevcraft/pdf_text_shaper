import 'package:urdu_pdf_fixer/urdu_pdf_fixer.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('UrduTextExtension', () {
    test('detects Urdu text in mixed content', () {
      expect('اردو: میں اردو میں لکھ رہا ہوں۔'.containsUrdu, isTrue);
      expect('English only'.containsUrdu, isFalse);
      expect('Invoice 123 — کل 500'.containsUrdu, isTrue);
    });

    test('keeps readable alias', () {
      expect('اردو: میں اردو میں لکھ رہا ہوں۔'.isUrduText, isTrue);
      expect('English only'.isUrduText, isFalse);
    });

    test('strict script-only detection rejects Latin content', () {
      expect('تعلیم طالب علم امتحان اطلاع ذمہ داری پاکستان'.isUrduOnly, isTrue);
      expect('اردو: میں اردو میں لکھ رہا ہوں۔ English'.isUrduOnly, isFalse);
      expect('   '.isUrduOnly, isFalse);
    });
  });
}
