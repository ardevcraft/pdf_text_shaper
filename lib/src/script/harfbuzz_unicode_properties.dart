import 'package:harfbuzz_ffi/harfbuzz_ffi_bindings.dart' as hb;

final class HarfBuzzScriptProperties {
  const HarfBuzzScriptProperties({
    required this.tag,
    required this.isRightToLeft,
    required this.isCommon,
    required this.isInherited,
    required this.isUnknown,
  });

  final int tag;
  final bool isRightToLeft;
  final bool isCommon;
  final bool isInherited;
  final bool isUnknown;

  bool get isStrong => !isCommon && !isInherited && !isUnknown;
}

/// Unicode script properties backed by HarfBuzz's Unicode database.
///
/// Keeping this internal means the shaping pipeline follows the same Unicode
/// data HarfBuzz uses instead of maintaining a second language/script table.
abstract final class HarfBuzzUnicodeProperties {
  static final _unicodeFunctions = hb.hb_unicode_funcs_get_default();

  static final int _commonTag = _tag('Zyyy');
  static final int _inheritedTag = _tag('Zinh');
  static final int _unknownTag = _tag('Zzzz');

  static HarfBuzzScriptProperties ofRune(int rune) {
    final script = hb.hb_unicode_script(_unicodeFunctions, rune);
    final tag = hb.hb_script_to_iso15924_tag(script);
    final direction = hb.hb_script_get_horizontal_direction(script);

    return HarfBuzzScriptProperties(
      tag: tag,
      isRightToLeft: direction == hb.hb_direction_t.HB_DIRECTION_RTL,
      isCommon: tag == _commonTag,
      isInherited: tag == _inheritedTag,
      isUnknown: tag == _unknownTag,
    );
  }

  /// Returns whether [rune] is a decimal digit that participates in an LTR
  /// numeric run inside RTL text.
  ///
  /// These cover the digit sets commonly used with Arabic-script text,
  /// including Persian, Arabic-Indic, and ASCII digits.
  static bool isBidiNumber(int rune) =>
      _between(rune, 0x0030, 0x0039) ||
      _between(rune, 0x0660, 0x0669) ||
      _between(rune, 0x06F0, 0x06F9);

  /// Includes separators between digits and a leading sign, so decimal,
  /// grouped, date, and time values stay in one LTR run.
  static bool isNumericRunCharacter(List<int> runes, int index) {
    final rune = runes[index];
    if (isBidiNumber(rune)) return true;

    final isSeparator =
        rune == 0x002C || // comma
        rune == 0x002E || // full stop
        rune == 0x002F || // slash
        rune == 0x003A || // colon
        rune == 0x002D || // hyphen-minus
        rune == 0x066B || // Arabic decimal separator
        rune == 0x066C || // Arabic thousands separator
        rune == 0x2212; // minus sign

    if (isSeparator &&
        index > 0 &&
        index + 1 < runes.length &&
        isBidiNumber(runes[index - 1]) &&
        isBidiNumber(runes[index + 1])) {
      return true;
    }

    final isLeadingSign = rune == 0x002B || rune == 0x002D || rune == 0x2212;
    return isLeadingSign &&
        index + 1 < runes.length &&
        isBidiNumber(runes[index + 1]) &&
        (index == 0 || !isBidiNumber(runes[index - 1]));
  }

  static bool firstStrongIsRightToLeft(String text) {
    for (final rune in text.runes) {
      if (isBidiNumber(rune)) continue;
      final properties = ofRune(rune);
      if (properties.isStrong) return properties.isRightToLeft;
    }
    return false;
  }

  static bool _between(int rune, int start, int end) =>
      rune >= start && rune <= end;

  static int _tag(String value) {
    assert(value.length == 4);
    final units = value.codeUnits;
    return (units[0] << 24) | (units[1] << 16) | (units[2] << 8) | units[3];
  }
}
