import 'package:gujarati_pdf_fixer/gujarati_pdf_fixer.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('GujaratiTextExtension', () {
    test('detects Gujarati text in mixed content', () {
      expect('ગુજરાતી: હું ગુજરાતીમાં લખું છું.'.containsGujarati, isTrue);
      expect('English only'.containsGujarati, isFalse);
      expect('Invoice 123 — કુલ ₹500'.containsGujarati, isTrue);
    });

    test('keeps readable alias', () {
      expect('ગુજરાતી: હું ગુજરાતીમાં લખું છું.'.isGujaratiText, isTrue);
      expect('English only'.isGujaratiText, isFalse);
    });

    test('strict script-only detection rejects Latin content', () {
      expect('શિક્ષણ વિદ્યાર્થી પરીક્ષા સૂચના જવાબદારી ગુજરાત'.isGujaratiOnly, isTrue);
      expect('ગુજરાતી: હું ગુજરાતીમાં લખું છું. English'.isGujaratiOnly, isFalse);
      expect('   '.isGujaratiOnly, isFalse);
    });
  });
}
