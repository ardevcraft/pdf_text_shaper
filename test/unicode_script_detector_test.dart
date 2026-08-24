import 'package:pdf_text_shaper/pdf_text_shaper.dart';
import 'package:test/test.dart';

void main() {
  group('UnicodeScriptDetector', () {
    test('detects major scripts', () {
      expect(
        UnicodeScriptDetector.firstStrongScript('বাংলা'),
        UnicodeScript.bengali,
      );
      expect(
        UnicodeScriptDetector.firstStrongScript('हिन्दी'),
        UnicodeScript.devanagari,
      );
      expect(
        UnicodeScriptDetector.firstStrongScript('தமிழ்'),
        UnicodeScript.tamil,
      );
      expect(
        UnicodeScriptDetector.firstStrongScript('العربية'),
        UnicodeScript.arabic,
      );
    });

    test('common punctuation does not hide the first strong script', () {
      expect(
        UnicodeScriptDetector.firstStrongScript('123 — বাংলা'),
        UnicodeScript.bengali,
      );
    });

    test('recognizes RTL scripts', () {
      expect(UnicodeScript.arabic.isRightToLeft, isTrue);
      expect(UnicodeScript.hebrew.isRightToLeft, isTrue);
      expect(UnicodeScript.bengali.isRightToLeft, isFalse);
    });
  });
}
