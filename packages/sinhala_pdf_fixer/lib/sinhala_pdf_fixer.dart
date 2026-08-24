/// Unicode-first Sinhala text rendering for `package:pdf`.
///
/// Text shaping and glyph rendering are delegated to `pdf_text_shaper` and
/// HarfBuzz. This package adds Flutter asset font loading and Sinhala-focused
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

export 'src/font/sinhala_font_manager.dart';
export 'src/text/sinhala_text_extension.dart';
export 'src/text/sinhala_typography.dart';
export 'src/widgets/sinhala_bullet_list.dart';
export 'src/widgets/sinhala_header.dart';
export 'src/widgets/sinhala_paragraph.dart';
export 'src/widgets/sinhala_rich_text.dart';
export 'src/widgets/sinhala_table.dart';
export 'src/widgets/sinhala_text.dart';
