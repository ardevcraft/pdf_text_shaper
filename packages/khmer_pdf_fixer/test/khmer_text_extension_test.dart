import 'package:khmer_pdf_fixer/khmer_pdf_fixer.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('KhmerTextExtension', () {
    test('detects Khmer text in mixed content', () {
      expect('ខ្មែរ: ខ្ញុំកំពុងសរសេរជាភាសាខ្មែរ។'.containsKhmer, isTrue);
      expect('English only'.containsKhmer, isFalse);
      expect('Invoice 123 — សរុប 500៛'.containsKhmer, isTrue);
    });

    test('keeps readable alias', () {
      expect('ខ្មែរ: ខ្ញុំកំពុងសរសេរជាភាសាខ្មែរ។'.isKhmerText, isTrue);
      expect('English only'.isKhmerText, isFalse);
    });

    test('strict script-only detection rejects Latin content', () {
      expect('ខ្មែរ'.isKhmerOnly, isTrue);
      expect('ខ្មែរ: ខ្ញុំកំពុងសរសេរជាភាសាខ្មែរ។ English'.isKhmerOnly, isFalse);
      expect('   '.isKhmerOnly, isFalse);
    });
  });
}
