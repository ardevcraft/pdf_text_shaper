/// Unicode-first Khmer text rendering for `package:pdf`.
///
/// Text shaping and glyph rendering are delegated to `pdf_text_shaper` and
/// HarfBuzz. This package adds Flutter asset font loading and Khmer-focused
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

export 'src/font/khmer_font_manager.dart';
export 'src/text/khmer_text_extension.dart';
export 'src/text/khmer_typography.dart';
export 'src/widgets/khmer_bullet_list.dart';
export 'src/widgets/khmer_header.dart';
export 'src/widgets/khmer_paragraph.dart';
export 'src/widgets/khmer_rich_text.dart';
export 'src/widgets/khmer_table.dart';
export 'src/widgets/khmer_text.dart';
