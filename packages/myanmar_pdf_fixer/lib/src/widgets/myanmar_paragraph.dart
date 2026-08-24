import 'package:pdf/pdf.dart';
import 'package:pdf_text_shaper/pdf_text_shaper.dart';

import 'myanmar_text.dart';

/// A Myanmar text preset tuned for body copy and flowing paragraphs.
final class MyanmarParagraph extends MyanmarText {
  MyanmarParagraph(
    super.text, {
    ShapedTextStyle? style,
    ShapedFont? font,
    List<ShapedFont> fallbackFonts = const <ShapedFont>[],
    double fontSize = 14,
    PdfColor color = PdfColors.black,
    double lineHeight = 1.25,
    ShapedTextAlign align = ShapedTextAlign.start,
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
