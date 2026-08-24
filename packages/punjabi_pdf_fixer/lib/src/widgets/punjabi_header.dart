import 'package:pdf/pdf.dart';
import 'package:pdf_text_shaper/pdf_text_shaper.dart';

import 'punjabi_text.dart';

/// A Punjabi text preset for headings and section titles.
final class PunjabiHeader extends PunjabiText {
  PunjabiHeader(
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
