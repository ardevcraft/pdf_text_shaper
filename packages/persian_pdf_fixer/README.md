# persian_pdf_fixer

Unicode-first **Persian** text rendering for PDFs generated with Flutter's `pdf` package.

This package is a thin language-focused facade over `pdf_text_shaper`. HarfBuzz performs real OpenType shaping while this package adds convenient font loading, script detection and PDF widgets.

## Features

- HarfBuzz GSUB/GPOS shaping through `pdf_text_shaper`
- Unicode-first Persian text
- fallback fonts for mixed-script documents
- multiline wrapping and reusable typography
- optional invisible Unicode layer for search/copy
- `PersianText`, `PersianParagraph`, `PersianHeader`
- `PersianRichText`, `PersianBulletList`, `PersianTable`
- `PersianFontManager` with safe asset caching/retry
- RTL-friendly defaults for text alignment, lists, rich text and tables
- no bundled fonts

## Install

```yaml
dependencies:
  persian_pdf_fixer: ^1.0.0
```

Add a Unicode OpenType font with Persian glyph coverage and OpenType shaping tables. For example, use `Vazirmatn-Regular.ttf` or another Persian-capable font licensed for your application.

## Basic usage

```dart
final font = await PersianFontManager.instance.loadAsset(
  'assets/fonts/Vazirmatn-Regular.ttf',
);

PersianParagraph(
  'شماره پیگیری: ۱۲۳۴۵۶۷۸۹۰ — مبلغ: ۱۲۳٬۴۵۶٫۷۸ ریال',
  font: font,
  fontSize: 14,
)
```

For a mixed-script example, the package's `example/main.dart` writes a PDF with
Persian text, Persian digits, numeric separators, and an English reference ID.
Run it from the package directory with a font file path:

```sh
dart run example/main.dart /path/to/Vazirmatn-Regular.ttf
```

For an interactive macOS test app with font selection, an in-app PDF preview,
and an option to save and open the PDF in the default viewer, see
[`example/README.md`](example/README.md).

To test against a local `pdf_text_shaper` checkout, add this temporary override
to this package's `pubspec.yaml` while working inside the repository:

```yaml
dependency_overrides:
  pdf_text_shaper:
    path: ../..
```

Then run `flutter pub get`, `flutter test`, and the example command above.
Remove the override before publishing this package.

## Typography

```dart
final typography = PersianTypography(
  regularFont: regular,
  boldFont: bold,
  fallbackFonts: [latinRegular],
  boldFallbackFonts: [latinBold],
);

PersianHeader(
  'Persian document',
  style: typography.heading(fontSize: 24),
)
```

## Detection

```dart
'فارسی: من به زبان فارسی می‌نویسم.'.containsPersian; // true
```

## Font lifecycle

```dart
await PersianFontManager.instance.dispose();
```

The package intentionally does not bundle fonts. Verify the license of any font you ship with your application.

## Platforms

Android, iOS, Linux, macOS and Windows. Web is not currently supported by the native shaping backend.
