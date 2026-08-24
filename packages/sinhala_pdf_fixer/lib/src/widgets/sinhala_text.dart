import 'package:pdf/pdf.dart';
import 'package:pdf_text_shaper/pdf_text_shaper.dart';

typedef SinhalaTextStyle = ShapedTextStyle;
typedef SinhalaTextAlign = ShapedTextAlign;

/// Unicode-first Sinhala text for `package:pdf`.
///
/// Provide either a complete [style] or a [font] with convenience style
/// arguments. Shaping/rendering is delegated to `pdf_text_shaper`.
class SinhalaText extends ShapedText {
  SinhalaText(
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
    String super.language = 'si',
  }) : assert(
         style != null || font != null,
         'Provide either style or font to SinhalaText.',
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
