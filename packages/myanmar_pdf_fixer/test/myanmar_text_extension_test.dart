import 'package:myanmar_pdf_fixer/myanmar_pdf_fixer.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('MyanmarTextExtension', () {
    test('detects Myanmar/Burmese text in mixed content', () {
      expect('မြန်မာ: ကျွန်ုပ် မြန်မာဘာသာဖြင့် ရေးသားနေပါသည်။'.containsMyanmar, isTrue);
      expect('English only'.containsMyanmar, isFalse);
      expect('Invoice 123 — စုစုပေါင်း 500 ကျပ်'.containsMyanmar, isTrue);
    });

    test('keeps readable alias', () {
      expect('မြန်မာ: ကျွန်ုပ် မြန်မာဘာသာဖြင့် ရေးသားနေပါသည်။'.isMyanmarText, isTrue);
      expect('English only'.isMyanmarText, isFalse);
    });

    test('strict script-only detection rejects Latin content', () {
      expect('မြန်မာ'.isMyanmarOnly, isTrue);
      expect('မြန်မာ: ကျွန်ုပ် မြန်မာဘာသာဖြင့် ရေးသားနေပါသည်။ English'.isMyanmarOnly, isFalse);
      expect('   '.isMyanmarOnly, isFalse);
    });
  });
}
