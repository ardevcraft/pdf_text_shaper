import 'package:punjabi_pdf_fixer/punjabi_pdf_fixer.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('PunjabiTextExtension', () {
    test('detects Punjabi (Gurmukhi) text in mixed content', () {
      expect('ਪੰਜਾਬੀ: ਮੈਂ ਪੰਜਾਬੀ ਵਿੱਚ ਲਿਖ ਰਿਹਾ ਹਾਂ।'.containsPunjabi, isTrue);
      expect('English only'.containsPunjabi, isFalse);
      expect('Invoice 123 — ਕੁੱਲ ₹500'.containsPunjabi, isTrue);
    });

    test('keeps readable alias', () {
      expect('ਪੰਜਾਬੀ: ਮੈਂ ਪੰਜਾਬੀ ਵਿੱਚ ਲਿਖ ਰਿਹਾ ਹਾਂ।'.isPunjabiText, isTrue);
      expect('English only'.isPunjabiText, isFalse);
    });

    test('strict script-only detection rejects Latin content', () {
      expect('ਸਿੱਖਿਆ ਵਿਦਿਆਰਥੀ ਪ੍ਰੀਖਿਆ ਸੂਚਨਾ ਜ਼ਿੰਮੇਵਾਰੀ ਪੰਜਾਬ'.isPunjabiOnly, isTrue);
      expect('ਪੰਜਾਬੀ: ਮੈਂ ਪੰਜਾਬੀ ਵਿੱਚ ਲਿਖ ਰਿਹਾ ਹਾਂ। English'.isPunjabiOnly, isFalse);
      expect('   '.isPunjabiOnly, isFalse);
    });
  });
}
