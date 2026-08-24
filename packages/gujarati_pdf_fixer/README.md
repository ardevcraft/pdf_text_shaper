# gujarati_pdf_fixer

Unicode-first **Gujarati** text rendering for PDFs generated with Flutter's `pdf` package.

This package is a thin language-focused facade over `pdf_text_shaper`. HarfBuzz performs real OpenType shaping while this package adds convenient font loading, script detection and PDF widgets.

## Features

- HarfBuzz GSUB/GPOS shaping through `pdf_text_shaper`
- Unicode-first Gujarati text
- fallback fonts for mixed-script documents
- multiline wrapping and reusable typography
- optional invisible Unicode layer for search/copy
- `GujaratiText`, `GujaratiParagraph`, `GujaratiHeader`
- `GujaratiRichText`, `GujaratiBulletList`, `GujaratiTable`
- `GujaratiFontManager` with safe asset caching/retry
- no bundled fonts

## Install

```yaml
dependencies:
  gujarati_pdf_fixer: ^1.0.0
```

Add a Unicode OpenType font that supports the **Gujarati** script. For example, a suitable Noto font such as `NotoSansGujarati-Regular.ttf`.

## Basic usage

```dart
final font = await GujaratiFontManager.instance.loadAsset(
  'assets/fonts/NotoSansGujarati-Regular.ttf',
);

GujaratiParagraph(
  'ગુજરાતી: હું ગુજરાતીમાં લખું છું.',
  font: font,
  fontSize: 14,
)
```

## Typography

```dart
final typography = GujaratiTypography(
  regularFont: regular,
  boldFont: bold,
  fallbackFonts: [latinRegular],
  boldFallbackFonts: [latinBold],
);

GujaratiHeader(
  'Gujarati document',
  style: typography.heading(fontSize: 24),
)
```

## Detection

```dart
'ગુજરાતી: હું ગુજરાતીમાં લખું છું.'.containsGujarati; // true
```

## Font lifecycle

```dart
await GujaratiFontManager.instance.dispose();
```

The package intentionally does not bundle fonts. Verify the license of any font you ship with your application.

## Platforms

Android, iOS, Linux, macOS and Windows. Web is not currently supported by the native shaping backend.
