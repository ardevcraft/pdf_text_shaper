import 'package:pdf_text_shaper/pdf_text_shaper.dart';
import 'package:test/test.dart';

void main() {
  test('ShapedGlyph preserves HarfBuzz positioning', () {
    const glyph = ShapedGlyph(
      glyphId: 42,
      cluster: 3,
      xAdvance: 500,
      yAdvance: 0,
      xOffset: -20,
      yOffset: 10,
    );

    expect(glyph.glyphId, 42);
    expect(glyph.cluster, 3);
    expect(glyph.xAdvance, 500);
    expect(glyph.xOffset, -20);
  });

  test('font metrics scale by units-per-em', () {
    const metrics = ShapedFontMetrics(
      unitsPerEm: 1000,
      ascender: 800,
      descender: -200,
      lineGap: 200,
    );

    expect(metrics.scaleFor(10), 0.01);
    expect(metrics.lineHeightFor(10), 12);
  });
}
