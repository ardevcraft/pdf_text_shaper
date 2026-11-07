import 'package:malayalam_pdf_fixer/malayalam_pdf_fixer.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('MalayalamTextExtension', () {
    test('detects Malayalam text in mixed content', () {
      expect('മലയാളം: ഞാൻ മലയാളത്തിൽ എഴുതുന്നു.'.containsMalayalam, isTrue);
      expect('English only'.containsMalayalam, isFalse);
      expect('Invoice 123 — ആകെ ₹500'.containsMalayalam, isTrue);
    });

    test('keeps readable alias', () {
      expect('മലയാളം: ഞാൻ മലയാളത്തിൽ എഴുതുന്നു.'.isMalayalamText, isTrue);
      expect('English only'.isMalayalamText, isFalse);
    });

    test('strict script-only detection rejects Latin content', () {
      expect('മലയാളം'.isMalayalamOnly, isTrue);
      expect(
        'മലയാളം: ഞാൻ മലയാളത്തിൽ എഴുതുന്നു. English'.isMalayalamOnly,
        isFalse,
      );
      expect('   '.isMalayalamOnly, isFalse);
    });
  });
}
