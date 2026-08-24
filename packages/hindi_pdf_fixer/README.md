# hindi_pdf_fixer

Unicode-first **Hindi** text rendering for PDFs generated with Flutter's `pdf` package.

This package is a thin language-focused facade over `pdf_text_shaper`. HarfBuzz performs real OpenType shaping while this package adds convenient font loading, script detection and PDF widgets.

## Features

- HarfBuzz GSUB/GPOS shaping through `pdf_text_shaper`
- Unicode-first Hindi text
- fallback fonts for mixed-script documents
- multiline wrapping and reusable typography
- optional invisible Unicode layer for search/copy
- `HindiText`, `HindiParagraph`, `HindiHeader`
- `HindiRichText`, `HindiBulletList`, `HindiTable`
- `HindiFontManager` with safe asset caching/retry
- no bundled fonts

## Install

```yaml
dependencies:
  hindi_pdf_fixer: ^1.0.0
```

Add a Unicode OpenType font that supports the **Devanagari** script. For example, a suitable Noto font such as `NotoSansDevanagari-Regular.ttf`.

## Basic usage

```dart
final font = await HindiFontManager.instance.loadAsset(
  'assets/fonts/NotoSansDevanagari-Regular.ttf',
);

HindiParagraph(
  'हिन्दी: मैं हिंदी में लिख रहा हूँ।',
  font: font,
  fontSize: 14,
)
```

## Typography

```dart
final typography = HindiTypography(
  regularFont: regular,
  boldFont: bold,
  fallbackFonts: [latinRegular],
  boldFallbackFonts: [latinBold],
);

HindiHeader(
  'Hindi document',
  style: typography.heading(fontSize: 24),
)
```

## Detection

```dart
'हिन्दी: मैं हिंदी में लिख रहा हूँ।'.containsHindi; // true
```

## Font lifecycle

```dart
await HindiFontManager.instance.dispose();
```

The package intentionally does not bundle fonts. Verify the license of any font you ship with your application.

## Platforms

Android, iOS, Linux, macOS and Windows. Web is not currently supported by the native shaping backend.
