# telugu_pdf_fixer

Unicode-first **Telugu** text rendering for PDFs generated with Flutter's `pdf` package.

This package is a thin language-focused facade over `pdf_text_shaper`. HarfBuzz performs real OpenType shaping while this package adds convenient font loading, script detection and PDF widgets.

## Features

- HarfBuzz GSUB/GPOS shaping through `pdf_text_shaper`
- Unicode-first Telugu text
- fallback fonts for mixed-script documents
- multiline wrapping and reusable typography
- optional invisible Unicode layer for search/copy
- `TeluguText`, `TeluguParagraph`, `TeluguHeader`
- `TeluguRichText`, `TeluguBulletList`, `TeluguTable`
- `TeluguFontManager` with safe asset caching/retry
- no bundled fonts

## Install

```yaml
dependencies:
  telugu_pdf_fixer: ^1.0.0
```

Add a Unicode OpenType font that supports the **Telugu** script. For example, a suitable Noto font such as `NotoSansTelugu-Regular.ttf`.

## Basic usage

```dart
final font = await TeluguFontManager.instance.loadAsset(
  'assets/fonts/NotoSansTelugu-Regular.ttf',
);

TeluguParagraph(
  'తెలుగు: నేను తెలుగులో వ్రాస్తున్నాను.',
  font: font,
  fontSize: 14,
)
```

## Typography

```dart
final typography = TeluguTypography(
  regularFont: regular,
  boldFont: bold,
  fallbackFonts: [latinRegular],
  boldFallbackFonts: [latinBold],
);

TeluguHeader(
  'Telugu document',
  style: typography.heading(fontSize: 24),
)
```

## Detection

```dart
'తెలుగు: నేను తెలుగులో వ్రాస్తున్నాను.'.containsTelugu; // true
```

## Font lifecycle

```dart
await TeluguFontManager.instance.dispose();
```

The package intentionally does not bundle fonts. Verify the license of any font you ship with your application.

## Platforms

Android, iOS, Linux, macOS and Windows. Web is not currently supported by the native shaping backend.
