# bangla_pdf_fixer

Unicode-first **Bangla/Bengali** text rendering for PDFs generated with Flutter's `pdf` package.

This package is a thin language-focused facade over `pdf_text_shaper`. HarfBuzz performs real OpenType shaping while this package adds convenient font loading, script detection and PDF widgets.

## Features

- HarfBuzz GSUB/GPOS shaping through `pdf_text_shaper`
- Unicode-first Bangla/Bengali text
- fallback fonts for mixed-script documents
- multiline wrapping and reusable typography
- optional invisible Unicode layer for search/copy
- `BanglaText`, `BanglaParagraph`, `BanglaHeader`
- `BanglaRichText`, `BanglaBulletList`, `BanglaTable`
- `BanglaFontManager` with safe asset caching/retry
- no bundled fonts

## Install

```yaml
dependencies:
  bangla_pdf_fixer: ^3.1.0
```

Add a Unicode OpenType font that supports the **Bengali** script. For example, a suitable Noto font such as `NotoSansBengali-Regular.ttf`.

## Basic usage

```dart
final font = await BanglaFontManager.instance.loadAsset(
  'assets/fonts/NotoSansBengali-Regular.ttf',
);

BanglaParagraph(
  'আমি বাংলায় লিখছি।',
  font: font,
  fontSize: 14,
)
```

## Typography

```dart
final typography = BanglaTypography(
  regularFont: regular,
  boldFont: bold,
  fallbackFonts: [latinRegular],
  boldFallbackFonts: [latinBold],
);

BanglaHeader(
  'Bangla/Bengali document',
  style: typography.heading(fontSize: 24),
)
```

## Detection

```dart
'আমি বাংলায় লিখছি।'.containsBangla; // true
```

## Font lifecycle

```dart
await BanglaFontManager.instance.dispose();
```

The package intentionally does not bundle fonts. Verify the license of any font you ship with your application.

## Platforms

Android, iOS, Linux, macOS and Windows. Web is not currently supported by the native shaping backend.
