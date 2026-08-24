import 'package:lao_pdf_fixer/lao_pdf_fixer.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('LaoTextExtension', () {
    test('detects Lao text in mixed content', () {
      expect('ພາສາລາວ: ຂ້ອຍກຳລັງຂຽນພາສາລາວ.'.containsLao, isTrue);
      expect('English only'.containsLao, isFalse);
      expect('Invoice 123 — ລວມ 500₭'.containsLao, isTrue);
    });

    test('keeps readable alias', () {
      expect('ພາສາລາວ: ຂ້ອຍກຳລັງຂຽນພາສາລາວ.'.isLaoText, isTrue);
      expect('English only'.isLaoText, isFalse);
    });

    test('strict script-only detection rejects Latin content', () {
      expect('ພາສາລາວ'.isLaoOnly, isTrue);
      expect('ພາສາລາວ: ຂ້ອຍກຳລັງຂຽນພາສາລາວ. English'.isLaoOnly, isFalse);
      expect('   '.isLaoOnly, isFalse);
    });
  });
}
