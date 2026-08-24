/// Unicode-first Telugu text rendering for `package:pdf`.
///
/// Text shaping and glyph rendering are delegated to `pdf_text_shaper` and
/// HarfBuzz. This package adds Flutter asset font loading and Telugu-focused
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

export 'src/font/telugu_font_manager.dart';
export 'src/text/telugu_text_extension.dart';
export 'src/text/telugu_typography.dart';
export 'src/widgets/telugu_bullet_list.dart';
export 'src/widgets/telugu_header.dart';
export 'src/widgets/telugu_paragraph.dart';
export 'src/widgets/telugu_rich_text.dart';
export 'src/widgets/telugu_table.dart';
export 'src/widgets/telugu_text.dart';
