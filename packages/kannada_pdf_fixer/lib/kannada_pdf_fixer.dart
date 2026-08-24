/// Unicode-first Kannada text rendering for `package:pdf`.
///
/// Text shaping and glyph rendering are delegated to `pdf_text_shaper` and
/// HarfBuzz. This package adds Flutter asset font loading and Kannada-focused
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

export 'src/font/kannada_font_manager.dart';
export 'src/text/kannada_text_extension.dart';
export 'src/text/kannada_typography.dart';
export 'src/widgets/kannada_bullet_list.dart';
export 'src/widgets/kannada_header.dart';
export 'src/widgets/kannada_paragraph.dart';
export 'src/widgets/kannada_rich_text.dart';
export 'src/widgets/kannada_table.dart';
export 'src/widgets/kannada_text.dart';
