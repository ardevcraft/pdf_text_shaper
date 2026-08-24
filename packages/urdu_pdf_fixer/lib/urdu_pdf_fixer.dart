/// Unicode-first Urdu text rendering for `package:pdf`.
///
/// Text shaping and glyph rendering are delegated to `pdf_text_shaper` and
/// HarfBuzz. This package adds Flutter asset font loading and Urdu-focused
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

export 'src/font/urdu_font_manager.dart';
export 'src/text/urdu_text_extension.dart';
export 'src/text/urdu_typography.dart';
export 'src/widgets/urdu_bullet_list.dart';
export 'src/widgets/urdu_header.dart';
export 'src/widgets/urdu_paragraph.dart';
export 'src/widgets/urdu_rich_text.dart';
export 'src/widgets/urdu_table.dart';
export 'src/widgets/urdu_text.dart';
