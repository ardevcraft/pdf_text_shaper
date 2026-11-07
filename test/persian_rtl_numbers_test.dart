import 'package:pdf_text_shaper/src/script/harfbuzz_unicode_properties.dart';
import 'package:test/test.dart';

void main() {
  group('RTL numeric runs', () {
    test('Persian digits do not establish an RTL base direction', () {
      expect(
        HarfBuzzUnicodeProperties.firstStrongIsRightToLeft('۱۲۳۴۵'),
        isFalse,
      );
    });

    test('Persian text establishes RTL direction around Persian digits', () {
      expect(
        HarfBuzzUnicodeProperties.firstStrongIsRightToLeft('مبلغ ۱۲۳۴۵ تومان'),
        isTrue,
      );
    });

    test('ASCII and Arabic-Indic digits also form LTR numeric runs', () {
      for (final digit in <int>[0x0031, 0x0661, 0x06F1]) {
        expect(HarfBuzzUnicodeProperties.isBidiNumber(digit), isTrue);
      }
    });

    test('numeric separators stay with the number when between digits', () {
      final amount = '۱۲۳٫۴۵'.runes.toList(growable: false);
      final date = '۱۴۰۵/۰۲/۱۵'.runes.toList(growable: false);
      final id = '۱۲۳-۴۵۶'.runes.toList(growable: false);

      expect(
        HarfBuzzUnicodeProperties.isNumericRunCharacter(amount, 3),
        isTrue,
      );
      expect(HarfBuzzUnicodeProperties.isNumericRunCharacter(date, 4), isTrue);
      expect(HarfBuzzUnicodeProperties.isNumericRunCharacter(id, 3), isTrue);
    });
  });
}
