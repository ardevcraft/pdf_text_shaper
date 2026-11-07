/// Unicode-first Persian text rendering for `package:pdf`.
///
/// Text shaping and glyph rendering are delegated to `pdf_text_shaper` and
/// HarfBuzz. This package adds Flutter asset font loading and Persian-focused
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

export 'src/font/persian_font_manager.dart';
export 'src/text/persian_text_extension.dart';
export 'src/text/persian_typography.dart';
export 'src/widgets/persian_bullet_list.dart';
export 'src/widgets/persian_header.dart';
export 'src/widgets/persian_paragraph.dart';
export 'src/widgets/persian_rich_text.dart';
export 'src/widgets/persian_table.dart';
export 'src/widgets/persian_text.dart';
