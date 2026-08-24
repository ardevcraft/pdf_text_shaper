/// Unicode-first Arabic text rendering for `package:pdf`.
///
/// Text shaping and glyph rendering are delegated to `pdf_text_shaper` and
/// HarfBuzz. This package adds Flutter asset font loading and Arabic-focused
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

export 'src/font/arabic_font_manager.dart';
export 'src/text/arabic_text_extension.dart';
export 'src/text/arabic_typography.dart';
export 'src/widgets/arabic_bullet_list.dart';
export 'src/widgets/arabic_header.dart';
export 'src/widgets/arabic_paragraph.dart';
export 'src/widgets/arabic_rich_text.dart';
export 'src/widgets/arabic_table.dart';
export 'src/widgets/arabic_text.dart';
