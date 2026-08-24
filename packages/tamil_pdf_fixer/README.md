# tamil_pdf_fixer

Unicode-first **Tamil** text rendering for PDFs generated with Flutter's `pdf` package.

This package is a thin language-focused facade over `pdf_text_shaper`. HarfBuzz performs real OpenType shaping while this package adds convenient font loading, script detection and PDF widgets.

## Features

- HarfBuzz GSUB/GPOS shaping through `pdf_text_shaper`
- Unicode-first Tamil text
- fallback fonts for mixed-script documents
- multiline wrapping and reusable typography
- optional invisible Unicode layer for search/copy
- `TamilText`, `TamilParagraph`, `TamilHeader`
- `TamilRichText`, `TamilBulletList`, `TamilTable`
- `TamilFontManager` with safe asset caching/retry
- no bundled fonts

## Install

```yaml
dependencies:
  tamil_pdf_fixer: ^1.0.0
```

Add a Unicode OpenType font that supports the **Tamil** script. For example, a suitable Noto font such as `NotoSansTamil-Regular.ttf`.

## Basic usage

```dart
final font = await TamilFontManager.instance.loadAsset(
  'assets/fonts/NotoSansTamil-Regular.ttf',
);

TamilParagraph(
  'தமிழ்: நான் தமிழில் எழுதுகிறேன்.',
  font: font,
  fontSize: 14,
)
```

## Typography

```dart
final typography = TamilTypography(
  regularFont: regular,
  boldFont: bold,
  fallbackFonts: [latinRegular],
  boldFallbackFonts: [latinBold],
);

TamilHeader(
  'Tamil document',
  style: typography.heading(fontSize: 24),
)
```

## Detection

```dart
'தமிழ்: நான் தமிழில் எழுதுகிறேன்.'.containsTamil; // true
```

## Font lifecycle

```dart
await TamilFontManager.instance.dispose();
```

The package intentionally does not bundle fonts. Verify the license of any font you ship with your application.

## Platforms

Android, iOS, Linux, macOS and Windows. Web is not currently supported by the native shaping backend.
