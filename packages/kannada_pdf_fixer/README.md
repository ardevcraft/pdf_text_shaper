# kannada_pdf_fixer

Unicode-first **Kannada** text rendering for PDFs generated with Flutter's `pdf` package.

This package is a thin language-focused facade over `pdf_text_shaper`. HarfBuzz performs real OpenType shaping while this package adds convenient font loading, script detection and PDF widgets.

## Features

- HarfBuzz GSUB/GPOS shaping through `pdf_text_shaper`
- Unicode-first Kannada text
- fallback fonts for mixed-script documents
- multiline wrapping and reusable typography
- optional invisible Unicode layer for search/copy
- `KannadaText`, `KannadaParagraph`, `KannadaHeader`
- `KannadaRichText`, `KannadaBulletList`, `KannadaTable`
- `KannadaFontManager` with safe asset caching/retry
- no bundled fonts

## Install

```yaml
dependencies:
  kannada_pdf_fixer: ^1.0.0
```

Add a Unicode OpenType font that supports the **Kannada** script. For example, a suitable Noto font such as `NotoSansKannada-Regular.ttf`.

## Basic usage

```dart
final font = await KannadaFontManager.instance.loadAsset(
  'assets/fonts/NotoSansKannada-Regular.ttf',
);

KannadaParagraph(
  'ಕನ್ನಡ: ನಾನು ಕನ್ನಡದಲ್ಲಿ ಬರೆಯುತ್ತಿದ್ದೇನೆ.',
  font: font,
  fontSize: 14,
)
```

## Typography

```dart
final typography = KannadaTypography(
  regularFont: regular,
  boldFont: bold,
  fallbackFonts: [latinRegular],
  boldFallbackFonts: [latinBold],
);

KannadaHeader(
  'Kannada document',
  style: typography.heading(fontSize: 24),
)
```

## Detection

```dart
'ಕನ್ನಡ: ನಾನು ಕನ್ನಡದಲ್ಲಿ ಬರೆಯುತ್ತಿದ್ದೇನೆ.'.containsKannada; // true
```

## Font lifecycle

```dart
await KannadaFontManager.instance.dispose();
```

The package intentionally does not bundle fonts. Verify the license of any font you ship with your application.

## Platforms

Android, iOS, Linux, macOS and Windows. Web is not currently supported by the native shaping backend.
