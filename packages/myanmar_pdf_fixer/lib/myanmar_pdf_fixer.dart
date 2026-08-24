/// Unicode-first Myanmar/Burmese text rendering for `package:pdf`.
///
/// Text shaping and glyph rendering are delegated to `pdf_text_shaper` and
/// HarfBuzz. This package adds Flutter asset font loading and Myanmar/Burmese-focused
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

export 'src/font/myanmar_font_manager.dart';
export 'src/text/myanmar_text_extension.dart';
export 'src/text/myanmar_typography.dart';
export 'src/widgets/myanmar_bullet_list.dart';
export 'src/widgets/myanmar_header.dart';
export 'src/widgets/myanmar_paragraph.dart';
export 'src/widgets/myanmar_rich_text.dart';
export 'src/widgets/myanmar_table.dart';
export 'src/widgets/myanmar_text.dart';
