# Myanmar/Burmese PDF Fixer architecture

`myanmar_pdf_fixer` is a thin facade over `pdf_text_shaper`.

Pipeline:

```text
Unicode Myanmar/Burmese text
  -> HarfBuzz shaping
  -> positioned glyphs
  -> PDF glyph outlines
  -> optional invisible Unicode text
```

The facade owns language defaults (`my`), Flutter asset loading, script detection and convenience PDF widgets. It does not duplicate the shaping engine.
