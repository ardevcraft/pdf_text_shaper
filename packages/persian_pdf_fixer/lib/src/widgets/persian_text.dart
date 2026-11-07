import 'package:pdf/pdf.dart';
import 'package:pdf_text_shaper/pdf_text_shaper.dart';

typedef PersianTextStyle = ShapedTextStyle;
typedef PersianTextAlign = ShapedTextAlign;

/// Unicode-first Persian text for `package:pdf`.
///
/// Provide either a complete [style] or a [font] with convenience style
/// arguments. Shaping/rendering is delegated to `pdf_text_shaper`.
class PersianText extends ShapedText {
  PersianText(
    super.text, {
    ShapedTextStyle? style,
    ShapedFont? font,
    List<ShapedFont> fallbackFonts = const <ShapedFont>[],
    double fontSize = 16,
    PdfColor color = PdfColors.black,
    double? lineHeight,
    ShapedTextAlign align = ShapedTextAlign.end,
    bool preserveUnicodeText = true,
    super.maxLines,
    String super.language = 'fa',
  }) : assert(
         style != null || font != null,
         'Provide either style or font to PersianText.',
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
               direction: ShapedTextDirection.rightToLeft,
               preserveUnicodeText: preserveUnicodeText,
             ),
       );
}
