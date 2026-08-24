/// Unicode-first Gujarati text rendering for `package:pdf`.
///
/// Text shaping and glyph rendering are delegated to `pdf_text_shaper` and
/// HarfBuzz. This package adds Flutter asset font loading and Gujarati-focused
/// convenience widgets and text helpers.
library;

export 'package:pdf_text_shaper/pdf_text_shaper.dart'
    show
        ShapedFont,
        ShapedFontDiagnostics,
        ShapedText,
        ShapedTextAlign,
        ShapedTextDirection,
        ShapedTextStyle;

export 'src/font/gujarati_font_manager.dart';
export 'src/text/gujarati_text_extension.dart';
export 'src/text/gujarati_typography.dart';
export 'src/widgets/gujarati_bullet_list.dart';
export 'src/widgets/gujarati_header.dart';
export 'src/widgets/gujarati_paragraph.dart';
export 'src/widgets/gujarati_rich_text.dart';
export 'src/widgets/gujarati_table.dart';
export 'src/widgets/gujarati_text.dart';
