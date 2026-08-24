import 'package:pdf/pdf.dart';
import 'package:pdf_text_shaper/pdf_text_shaper.dart';

import 'telugu_text.dart';

/// A Telugu text preset tuned for body copy and flowing paragraphs.
final class TeluguParagraph extends TeluguText {
  TeluguParagraph(
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
