/// Unicode-first Malayalam text rendering for `package:pdf`.
///
/// Text shaping and glyph rendering are delegated to `pdf_text_shaper` and
/// HarfBuzz. This package adds Flutter asset font loading and Malayalam-focused
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

export 'src/font/malayalam_font_manager.dart';
export 'src/text/malayalam_text_extension.dart';
export 'src/text/malayalam_typography.dart';
export 'src/widgets/malayalam_bullet_list.dart';
export 'src/widgets/malayalam_header.dart';
export 'src/widgets/malayalam_paragraph.dart';
export 'src/widgets/malayalam_rich_text.dart';
export 'src/widgets/malayalam_table.dart';
export 'src/widgets/malayalam_text.dart';
