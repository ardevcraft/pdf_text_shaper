## 1.1.1

- Fixed Persian and Arabic-Indic digits being reordered in right-to-left text.
- Kept numeric runs and their separators in logical digit order in mixed-direction text.
- Added regression coverage for RTL numeric runs and base-direction detection.

## 1.1.0

- Initial public release.
- HarfBuzz GSUB/GPOS shaping through `harfbuzz_ffi`.
- Vector-outline PDF rendering.
- Unicode-preserving invisible text layer.
- Font fallback and Unicode-script segmentation.
- Automatic line wrapping and explicit newline support.
- Font coverage diagnostics.
- Native Android, iOS, Linux, macOS, and Windows support.
