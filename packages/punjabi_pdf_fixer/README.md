# punjabi_pdf_fixer

Unicode-first **Punjabi (Gurmukhi)** text rendering for PDFs generated with Flutter's `pdf` package.

This package is a thin language-focused facade over `pdf_text_shaper`. HarfBuzz performs real OpenType shaping while this package adds convenient font loading, script detection and PDF widgets.

## Features

- HarfBuzz GSUB/GPOS shaping through `pdf_text_shaper`
- Unicode-first Punjabi (Gurmukhi) text
- fallback fonts for mixed-script documents
- multiline wrapping and reusable typography
- optional invisible Unicode layer for search/copy
- `PunjabiText`, `PunjabiParagraph`, `PunjabiHeader`
- `PunjabiRichText`, `PunjabiBulletList`, `PunjabiTable`
- `PunjabiFontManager` with safe asset caching/retry
- no bundled fonts

## Install

```yaml
dependencies:
  punjabi_pdf_fixer: ^1.0.0
```

Add a Unicode OpenType font that supports the **Gurmukhi** script. For example, a suitable Noto font such as `NotoSansGurmukhi-Regular.ttf`.

## Basic usage

```dart
final font = await PunjabiFontManager.instance.loadAsset(
  'assets/fonts/NotoSansGurmukhi-Regular.ttf',
);

PunjabiParagraph(
  'ਪੰਜਾਬੀ: ਮੈਂ ਪੰਜਾਬੀ ਵਿੱਚ ਲਿਖ ਰਿਹਾ ਹਾਂ।',
  font: font,
  fontSize: 14,
)
```

## Typography

```dart
final typography = PunjabiTypography(
  regularFont: regular,
  boldFont: bold,
  fallbackFonts: [latinRegular],
  boldFallbackFonts: [latinBold],
);

PunjabiHeader(
  'Punjabi (Gurmukhi) document',
  style: typography.heading(fontSize: 24),
)
```

## Detection

```dart
'ਪੰਜਾਬੀ: ਮੈਂ ਪੰਜਾਬੀ ਵਿੱਚ ਲਿਖ ਰਿਹਾ ਹਾਂ।'.containsPunjabi; // true
```

## Font lifecycle

```dart
await PunjabiFontManager.instance.dispose();
```

The package intentionally does not bundle fonts. Verify the license of any font you ship with your application.

## Platforms

Android, iOS, Linux, macOS and Windows. Web is not currently supported by the native shaping backend.
