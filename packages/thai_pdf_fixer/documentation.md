# Thai PDF Fixer architecture

`thai_pdf_fixer` is a thin facade over `pdf_text_shaper`.

Pipeline:

```text
Unicode Thai text
  -> HarfBuzz shaping
  -> positioned glyphs
  -> PDF glyph outlines
  -> optional invisible Unicode text
```

The facade owns language defaults (`th`), Flutter asset loading, script detection and convenience PDF widgets. It does not duplicate the shaping engine.
