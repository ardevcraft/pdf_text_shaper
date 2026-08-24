extension HindiTextExtension on String {
  /// Whether the string contains at least one character from the Devanagari
  /// Unicode range used by Hindi text.
  bool get containsHindi => runes.any(_isHindiRune);

  /// Compatibility/readability alias for [containsHindi].
  bool get isHindiText => containsHindi;

  /// Whether every non-whitespace rune belongs to the configured script range.
  ///
  /// This is intentionally strict. Latin punctuation/digits make the result
  /// false. Use [containsHindi] for mixed-script content.
  bool get isHindiOnly {
    var found = false;
    for (final rune in runes) {
      if (_isWhitespace(rune)) continue;
      if (!_isHindiRune(rune)) return false;
      found = true;
    }
    return found;
  }

  /// Migration bridge for applications that previously transformed text.
  /// Unicode shaping requires the original string, so this is an identity.
  @Deprecated('Unicode shaping needs the original text. Pass the string directly.')
  String get fix => this;

  static bool _isHindiRune(int rune) =>
      (rune >= 0x0900 && rune <= 0x097F) ||
      (rune >= 0xA8E0 && rune <= 0xA8FF);

  static bool _isWhitespace(int rune) =>
      rune == 0x09 || rune == 0x0A || rune == 0x0D || rune == 0x20;
}
