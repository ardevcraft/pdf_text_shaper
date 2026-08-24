import 'package:tamil_pdf_fixer/tamil_pdf_fixer.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('TamilTextExtension', () {
    test('detects Tamil text in mixed content', () {
      expect('தமிழ்: நான் தமிழில் எழுதுகிறேன்.'.containsTamil, isTrue);
      expect('English only'.containsTamil, isFalse);
      expect('Invoice 123 — மொத்தம் ₹500'.containsTamil, isTrue);
    });

    test('keeps readable alias', () {
      expect('தமிழ்: நான் தமிழில் எழுதுகிறேன்.'.isTamilText, isTrue);
      expect('English only'.isTamilText, isFalse);
    });

    test('strict script-only detection rejects Latin content', () {
      expect('வணக்கம் உலகம் கல்வி மாணவர் தேர்வு அறிவிப்பு'.isTamilOnly, isTrue);
      expect('தமிழ்: நான் தமிழில் எழுதுகிறேன். English'.isTamilOnly, isFalse);
      expect('   '.isTamilOnly, isFalse);
    });
  });
}
