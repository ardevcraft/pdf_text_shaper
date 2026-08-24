/// Unicode-first Tamil text rendering for `package:pdf`.
///
/// Text shaping and glyph rendering are delegated to `pdf_text_shaper` and
/// HarfBuzz. This package adds Flutter asset font loading and Tamil-focused
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

export 'src/font/tamil_font_manager.dart';
export 'src/text/tamil_text_extension.dart';
export 'src/text/tamil_typography.dart';
export 'src/widgets/tamil_bullet_list.dart';
export 'src/widgets/tamil_header.dart';
export 'src/widgets/tamil_paragraph.dart';
export 'src/widgets/tamil_rich_text.dart';
export 'src/widgets/tamil_table.dart';
export 'src/widgets/tamil_text.dart';
