import 'package:pdf/pdf.dart';
import 'package:pdf_text_shaper/pdf_text_shaper.dart';

import 'arabic_text.dart';

/// A Arabic text preset for headings and section titles.
final class ArabicHeader extends ArabicText {
  ArabicHeader(
    super.text, {
    ShapedTextStyle? style,
    ShapedFont? font,
    List<ShapedFont> fallbackFonts = const <ShapedFont>[],
    double fontSize = 24,
    PdfColor color = PdfColors.black,
    double? lineHeight,
    ShapedTextAlign align = ShapedTextAlign.end,
    bool preserveUnicodeText = true,
    int? maxLines,
  }) : super(
         style: style,
         font: font,
         fallbackFonts: fallbackFonts,
         fontSize: fontSize,
         color: color,
         lineHeight: lineHeight,
         align: align,
         preserveUnicodeText: preserveUnicodeText,
         maxLines: maxLines,
       );
}
