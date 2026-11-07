import 'package:telugu_pdf_fixer/telugu_pdf_fixer.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('TeluguTextExtension', () {
    test('detects Telugu text in mixed content', () {
      expect('తెలుగు: నేను తెలుగులో వ్రాస్తున్నాను.'.containsTelugu, isTrue);
      expect('English only'.containsTelugu, isFalse);
      expect('Invoice 123 — మొత్తం ₹500'.containsTelugu, isTrue);
    });

    test('keeps readable alias', () {
      expect('తెలుగు: నేను తెలుగులో వ్రాస్తున్నాను.'.isTeluguText, isTrue);
      expect('English only'.isTeluguText, isFalse);
    });

    test('strict script-only detection rejects Latin content', () {
      expect(
        'విద్య విద్యార్థి పరీక్ష ప్రకటన బాధ్యత తెలుగు'.isTeluguOnly,
        isTrue,
      );
      expect(
        'తెలుగు: నేను తెలుగులో వ్రాస్తున్నాను. English'.isTeluguOnly,
        isFalse,
      );
      expect('   '.isTeluguOnly, isFalse);
    });
  });
}
