# sinhala_pdf_fixer

Unicode-first **Sinhala** text rendering for PDFs generated with Flutter's `pdf` package.

This package is a thin language-focused facade over `pdf_text_shaper`. HarfBuzz performs real OpenType shaping while this package adds convenient font loading, script detection and PDF widgets.

## Features

- HarfBuzz GSUB/GPOS shaping through `pdf_text_shaper`
- Unicode-first Sinhala text
- fallback fonts for mixed-script documents
- multiline wrapping and reusable typography
- optional invisible Unicode layer for search/copy
- `SinhalaText`, `SinhalaParagraph`, `SinhalaHeader`
- `SinhalaRichText`, `SinhalaBulletList`, `SinhalaTable`
- `SinhalaFontManager` with safe asset caching/retry
- no bundled fonts

## Install

```yaml
dependencies:
  sinhala_pdf_fixer: ^1.0.0
```

Add a Unicode OpenType font that supports the **Sinhala** script. For example, a suitable Noto font such as `NotoSansSinhala-Regular.ttf`.

## Basic usage

```dart
final font = await SinhalaFontManager.instance.loadAsset(
  'assets/fonts/NotoSansSinhala-Regular.ttf',
);

SinhalaParagraph(
  'සිංහල: මම සිංහලෙන් ලියනවා.',
  font: font,
  fontSize: 14,
)
```

## Typography

```dart
final typography = SinhalaTypography(
  regularFont: regular,
  boldFont: bold,
  fallbackFonts: [latinRegular],
  boldFallbackFonts: [latinBold],
);

SinhalaHeader(
  'Sinhala document',
  style: typography.heading(fontSize: 24),
)
```

## Detection

```dart
'සිංහල: මම සිංහලෙන් ලියනවා.'.containsSinhala; // true
```

## Font lifecycle

```dart
await SinhalaFontManager.instance.dispose();
```

The package intentionally does not bundle fonts. Verify the license of any font you ship with your application.

## Platforms

Android, iOS, Linux, macOS and Windows. Web is not currently supported by the native shaping backend.

## Repository

This package is maintained in the central `pdf_text_shaper` repository:

- Repository: https://github.com/ardevcraft/pdf_text_shaper
- Issues: https://github.com/ardevcraft/pdf_text_shaper/issues
- Documentation: https://github.com/ardevcraft/pdf_text_shaper#readme
