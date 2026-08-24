# malayalam_pdf_fixer

Unicode-first **Malayalam** text rendering for PDFs generated with Flutter's `pdf` package.

This package is a thin language-focused facade over `pdf_text_shaper`. HarfBuzz performs real OpenType shaping while this package adds convenient font loading, script detection and PDF widgets.

## Features

- HarfBuzz GSUB/GPOS shaping through `pdf_text_shaper`
- Unicode-first Malayalam text
- fallback fonts for mixed-script documents
- multiline wrapping and reusable typography
- optional invisible Unicode layer for search/copy
- `MalayalamText`, `MalayalamParagraph`, `MalayalamHeader`
- `MalayalamRichText`, `MalayalamBulletList`, `MalayalamTable`
- `MalayalamFontManager` with safe asset caching/retry
- no bundled fonts

## Install

```yaml
dependencies:
  malayalam_pdf_fixer: ^1.0.0
```

Add a Unicode OpenType font that supports the **Malayalam** script. For example, a suitable Noto font such as `NotoSansMalayalam-Regular.ttf`.

## Basic usage

```dart
final font = await MalayalamFontManager.instance.loadAsset(
  'assets/fonts/NotoSansMalayalam-Regular.ttf',
);

MalayalamParagraph(
  'മലയാളം: ഞാൻ മലയാളത്തിൽ എഴുതുന്നു.',
  font: font,
  fontSize: 14,
)
```

## Typography

```dart
final typography = MalayalamTypography(
  regularFont: regular,
  boldFont: bold,
  fallbackFonts: [latinRegular],
  boldFallbackFonts: [latinBold],
);

MalayalamHeader(
  'Malayalam document',
  style: typography.heading(fontSize: 24),
)
```

## Detection

```dart
'മലയാളം: ഞാൻ മലയാളത്തിൽ എഴുതുന്നു.'.containsMalayalam; // true
```

## Font lifecycle

```dart
await MalayalamFontManager.instance.dispose();
```

The package intentionally does not bundle fonts. Verify the license of any font you ship with your application.

## Platforms

Android, iOS, Linux, macOS and Windows. Web is not currently supported by the native shaping backend.

## Repository

This package is maintained in the central `pdf_text_shaper` repository:

- Repository: https://github.com/ardevcraft/pdf_text_shaper
- Issues: https://github.com/ardevcraft/pdf_text_shaper/issues
- Documentation: https://github.com/ardevcraft/pdf_text_shaper#readme
