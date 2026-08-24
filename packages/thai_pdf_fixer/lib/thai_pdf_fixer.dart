/// Unicode-first Thai text rendering for `package:pdf`.
///
/// Text shaping and glyph rendering are delegated to `pdf_text_shaper` and
/// HarfBuzz. This package adds Flutter asset font loading and Thai-focused
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

export 'src/font/thai_font_manager.dart';
export 'src/text/thai_text_extension.dart';
export 'src/text/thai_typography.dart';
export 'src/widgets/thai_bullet_list.dart';
export 'src/widgets/thai_header.dart';
export 'src/widgets/thai_paragraph.dart';
export 'src/widgets/thai_rich_text.dart';
export 'src/widgets/thai_table.dart';
export 'src/widgets/thai_text.dart';
