# arabic_pdf_fixer

Unicode-first **Arabic** text rendering for PDFs generated with Flutter's `pdf` package.

This package is a thin language-focused facade over `pdf_text_shaper`. HarfBuzz performs real OpenType shaping while this package adds convenient font loading, script detection and PDF widgets.

## Features

- HarfBuzz GSUB/GPOS shaping through `pdf_text_shaper`
- Unicode-first Arabic text
- fallback fonts for mixed-script documents
- multiline wrapping and reusable typography
- optional invisible Unicode layer for search/copy
- `ArabicText`, `ArabicParagraph`, `ArabicHeader`
- `ArabicRichText`, `ArabicBulletList`, `ArabicTable`
- `ArabicFontManager` with safe asset caching/retry
- RTL-friendly defaults for text alignment, lists, rich text and tables
- no bundled fonts

## Install

```yaml
dependencies:
  arabic_pdf_fixer: ^1.0.0
```

Add a Unicode OpenType font that supports the **Arabic** script. For example, a suitable Noto font such as `NotoSansArabic-Regular.ttf`.

## Basic usage

```dart
final font = await ArabicFontManager.instance.loadAsset(
  'assets/fonts/NotoSansArabic-Regular.ttf',
);

ArabicParagraph(
  'العربية: أنا أكتب باللغة العربية.',
  font: font,
  fontSize: 14,
)
```

## Typography

```dart
final typography = ArabicTypography(
  regularFont: regular,
  boldFont: bold,
  fallbackFonts: [latinRegular],
  boldFallbackFonts: [latinBold],
);

ArabicHeader(
  'Arabic document',
  style: typography.heading(fontSize: 24),
)
```

## Detection

```dart
'العربية: أنا أكتب باللغة العربية.'.containsArabic; // true
```

## Font lifecycle

```dart
await ArabicFontManager.instance.dispose();
```

The package intentionally does not bundle fonts. Verify the license of any font you ship with your application.

## Platforms

Android, iOS, Linux, macOS and Windows. Web is not currently supported by the native shaping backend.
