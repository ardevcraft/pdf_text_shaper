/// Unicode-first Punjabi (Gurmukhi) text rendering for `package:pdf`.
///
/// Text shaping and glyph rendering are delegated to `pdf_text_shaper` and
/// HarfBuzz. This package adds Flutter asset font loading and Punjabi (Gurmukhi)-focused
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

export 'src/font/punjabi_font_manager.dart';
export 'src/text/punjabi_text_extension.dart';
export 'src/text/punjabi_typography.dart';
export 'src/widgets/punjabi_bullet_list.dart';
export 'src/widgets/punjabi_header.dart';
export 'src/widgets/punjabi_paragraph.dart';
export 'src/widgets/punjabi_rich_text.dart';
export 'src/widgets/punjabi_table.dart';
export 'src/widgets/punjabi_text.dart';
