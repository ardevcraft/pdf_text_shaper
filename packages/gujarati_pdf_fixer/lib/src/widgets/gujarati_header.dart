import 'package:pdf/pdf.dart';
import 'package:pdf_text_shaper/pdf_text_shaper.dart';

import 'gujarati_text.dart';

/// A Gujarati text preset for headings and section titles.
final class GujaratiHeader extends GujaratiText {
  GujaratiHeader(
    super.text, {
    ShapedTextStyle? style,
    ShapedFont? font,
    List<ShapedFont> fallbackFonts = const <ShapedFont>[],
    double fontSize = 24,
    PdfColor color = PdfColors.black,
    double? lineHeight,
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
