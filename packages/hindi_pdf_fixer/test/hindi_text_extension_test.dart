import 'package:hindi_pdf_fixer/hindi_pdf_fixer.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('HindiTextExtension', () {
    test('detects Hindi text in mixed content', () {
      expect('हिन्दी: मैं हिंदी में लिख रहा हूँ।'.containsHindi, isTrue);
      expect('English only'.containsHindi, isFalse);
      expect('Invoice 123 — कुल ₹500'.containsHindi, isTrue);
    });

    test('keeps readable alias', () {
      expect('हिन्दी: मैं हिंदी में लिख रहा हूँ।'.isHindiText, isTrue);
      expect('English only'.isHindiText, isFalse);
    });

    test('strict script-only detection rejects Latin content', () {
      expect(
        'क्षत्रिय नियुक्ति प्राधिकारी शिक्षा संस्कृति परीक्षा'.isHindiOnly,
        isTrue,
      );
      expect('हिन्दी: मैं हिंदी में लिख रहा हूँ। English'.isHindiOnly, isFalse);
      expect('   '.isHindiOnly, isFalse);
    });
  });
}
