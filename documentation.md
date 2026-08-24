# pdf_texxt_shaper — architecture and implementation notes

## Goal

Provide correct complex-script rendering for `package:pdf` without maintaining per-language replacement maps.

## Pipeline

1. Accept original Unicode text.
2. Segment by script/font coverage.
3. Shape each run with HarfBuzz.
4. Receive glyph IDs, clusters, advances, and offsets.
5. Ask HarfBuzz for the final glyph outlines.
6. Convert quadratic TrueType curves to cubic PDF Bézier curves.
7. Paint the glyph outlines on `PdfGraphics`.
8. Optionally write the original Unicode run in PDF invisible-text mode.

The original Unicode string is never replaced by ANSI pseudo-text.

## Public modules

- `ShapedFont`: owns Unicode font bytes, a `pw.Font`, and HarfBuzz face/font handles.
- `HarfBuzzShaper`: converts a Unicode run to `ShapedRun`.
- `UnicodeScriptDetector`: lightweight run segmentation helper.
- `ShapedFontDiagnostics`: checks cmap coverage through HarfBuzz.
- `ShapedText`: `package:pdf` widget that wraps, lays out, shapes, and paints.

## Font ownership

No font file is shipped by this package. Applications provide font bytes. This keeps the package font-neutral and avoids redistributing third-party font software.

## Why outline painting

`package:pdf` currently does not expose a high-level API that accepts arbitrary pre-shaped glyph IDs plus GPOS offsets. Painting HarfBuzz's final outlines preserves visual shaping without translating glyph IDs back into fake Unicode strings.

## Unicode extraction layer

The PDF visual layer is vector outlines, so it carries no text semantics by itself. When `preserveUnicodeText` is enabled, each original source run is additionally emitted using `PdfTextRenderingMode.invisible`.

This lets the normal `pdf` font implementation create Unicode mappings while HarfBuzz remains responsible for visual rendering.

## Bidi

HarfBuzz shapes RTL runs correctly. Version 0.1.0 determines paragraph direction from the first strong script and orders script runs accordingly. A full Unicode Bidirectional Algorithm resolver is intentionally left for a later release rather than claiming complete nested-bidi support.

## Performance

- Font handles are created once and reused.
- Unicode coverage results are cached per rune.
- Glyph outlines are cached per rendered widget/font.
- HarfBuzz shapes at the font's units-per-em and PDF scales paths at paint time.

A future release can move outline caches to the font/session level for cross-widget reuse.

## Release checklist

Before publishing on a machine with Dart 3.13+:

```bash
dart pub get
dart format --set-exit-if-changed .
dart analyze
dart test
dart pub publish --dry-run
```

Run the example with a legal Unicode font:

```bash
dart run example/main.dart /absolute/path/to/font.ttf
```

Inspect the generated PDF visually and verify copy/search behavior in at least two PDF viewers.
