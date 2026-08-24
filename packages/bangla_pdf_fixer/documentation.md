# Bangla/Bengali PDF Fixer architecture

`bangla_pdf_fixer` is a thin facade over `pdf_text_shaper`.

Pipeline:

```text
Unicode Bangla/Bengali text
  -> HarfBuzz shaping
  -> positioned glyphs
  -> PDF glyph outlines
  -> optional invisible Unicode text
```

The facade owns language defaults (`bn`), Flutter asset loading, script detection and convenience PDF widgets. It does not duplicate the shaping engine.
