import 'package:pdf/pdf.dart';
import 'package:pdf_text_shaper/pdf_text_shaper.dart';

typedef MyanmarTextStyle = ShapedTextStyle;
typedef MyanmarTextAlign = ShapedTextAlign;

/// Unicode-first Myanmar/Burmese text for `package:pdf`.
///
/// Provide either a complete [style] or a [font] with convenience style
/// arguments. Shaping/rendering is delegated to `pdf_text_shaper`.
class MyanmarText extends ShapedText {
  MyanmarText(
    super.text, {
    ShapedTextStyle? style,
    ShapedFont? font,
    List<ShapedFont> fallbackFonts = const <ShapedFont>[],
    double fontSize = 16,
    PdfColor color = PdfColors.black,
    double? lineHeight,
    ShapedTextAlign align = ShapedTextAlign.start,
    bool preserveUnicodeText = true,
    super.maxLines,
    String super.language = 'my',
  }) : assert(
         style != null || font != null,
         'Provide either style or font to MyanmarText.',
       ),
       super(
         style:
             style ??
             ShapedTextStyle(
               font: font!,
               fallbackFonts: fallbackFonts,
               fontSize: fontSize,
               color: color,
               lineHeight: lineHeight,
               align: align,
               preserveUnicodeText: preserveUnicodeText,
             ),
       );
}
