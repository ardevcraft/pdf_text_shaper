import 'package:bangla_pdf_fixer/bangla_pdf_fixer.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('BanglaTextExtension', () {
    test('detects Bangla/Bengali text in mixed content', () {
      expect('আমি বাংলায় লিখছি।'.containsBangla, isTrue);
      expect('English only'.containsBangla, isFalse);
      expect('Invoice ১২৩ — মোট ৳৫০০'.containsBangla, isTrue);
    });

    test('keeps readable alias', () {
      expect('আমি বাংলায় লিখছি।'.isBanglaText, isTrue);
      expect('English only'.isBanglaText, isFalse);
    });

    test('strict script-only detection rejects Latin content', () {
      expect('বাংলাদেশ শিক্ষার্থী রাষ্ট্র প্রজ্ঞাপন ক্ষুদ্র দায়িত্ব পরীক্ষা'.isBanglaOnly, isTrue);
      expect('আমি বাংলায় লিখছি। English'.isBanglaOnly, isFalse);
      expect('   '.isBanglaOnly, isFalse);
    });
  });
}
