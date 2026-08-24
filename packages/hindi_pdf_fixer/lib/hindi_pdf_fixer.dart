/// Unicode-first Hindi text rendering for `package:pdf`.
///
/// Text shaping and glyph rendering are delegated to `pdf_text_shaper` and
/// HarfBuzz. This package adds Flutter asset font loading and Hindi-focused
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

export 'src/font/hindi_font_manager.dart';
export 'src/text/hindi_text_extension.dart';
export 'src/text/hindi_typography.dart';
export 'src/widgets/hindi_bullet_list.dart';
export 'src/widgets/hindi_header.dart';
export 'src/widgets/hindi_paragraph.dart';
export 'src/widgets/hindi_rich_text.dart';
export 'src/widgets/hindi_table.dart';
export 'src/widgets/hindi_text.dart';
