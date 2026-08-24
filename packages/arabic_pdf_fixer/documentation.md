# Arabic PDF Fixer architecture

`arabic_pdf_fixer` is a thin facade over `pdf_text_shaper`.

Pipeline:

```text
Unicode Arabic text
  -> HarfBuzz shaping
  -> positioned glyphs
  -> PDF glyph outlines
  -> optional invisible Unicode text
```

The facade owns language defaults (`ar`), Flutter asset loading, script detection and convenience PDF widgets. It does not duplicate the shaping engine.
