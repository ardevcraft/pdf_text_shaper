import 'package:kannada_pdf_fixer/kannada_pdf_fixer.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('KannadaTextExtension', () {
    test('detects Kannada text in mixed content', () {
      expect('ಕನ್ನಡ: ನಾನು ಕನ್ನಡದಲ್ಲಿ ಬರೆಯುತ್ತಿದ್ದೇನೆ.'.containsKannada, isTrue);
      expect('English only'.containsKannada, isFalse);
      expect('Invoice 123 — ಒಟ್ಟು ₹500'.containsKannada, isTrue);
    });

    test('keeps readable alias', () {
      expect('ಕನ್ನಡ: ನಾನು ಕನ್ನಡದಲ್ಲಿ ಬರೆಯುತ್ತಿದ್ದೇನೆ.'.isKannadaText, isTrue);
      expect('English only'.isKannadaText, isFalse);
    });

    test('strict script-only detection rejects Latin content', () {
      expect('ಶಿಕ್ಷಣ ವಿದ್ಯಾರ್ಥಿ ಪರೀಕ್ಷೆ ಪ್ರಕಟಣೆ ಜವಾಬ್ದಾರಿ ಕರ್ನಾಟಕ'.isKannadaOnly, isTrue);
      expect('ಕನ್ನಡ: ನಾನು ಕನ್ನಡದಲ್ಲಿ ಬರೆಯುತ್ತಿದ್ದೇನೆ. English'.isKannadaOnly, isFalse);
      expect('   '.isKannadaOnly, isFalse);
    });
  });
}
