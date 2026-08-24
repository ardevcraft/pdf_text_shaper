/// Unicode-first Lao text rendering for `package:pdf`.
///
/// Text shaping and glyph rendering are delegated to `pdf_text_shaper` and
/// HarfBuzz. This package adds Flutter asset font loading and Lao-focused
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

export 'src/font/lao_font_manager.dart';
export 'src/text/lao_text_extension.dart';
export 'src/text/lao_typography.dart';
export 'src/widgets/lao_bullet_list.dart';
export 'src/widgets/lao_header.dart';
export 'src/widgets/lao_paragraph.dart';
export 'src/widgets/lao_rich_text.dart';
export 'src/widgets/lao_table.dart';
export 'src/widgets/lao_text.dart';
