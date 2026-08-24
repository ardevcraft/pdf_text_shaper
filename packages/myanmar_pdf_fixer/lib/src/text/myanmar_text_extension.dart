extension MyanmarTextExtension on String {
  /// Whether the string contains at least one character from the Myanmar
  /// Unicode range used by Myanmar/Burmese text.
  bool get containsMyanmar => runes.any(_isMyanmarRune);

  /// Compatibility/readability alias for [containsMyanmar].
  bool get isMyanmarText => containsMyanmar;

  /// Whether every non-whitespace rune belongs to the configured script range.
  ///
  /// This is intentionally strict. Latin punctuation/digits make the result
  /// false. Use [containsMyanmar] for mixed-script content.
  bool get isMyanmarOnly {
    var found = false;
    for (final rune in runes) {
      if (_isWhitespace(rune)) continue;
      if (!_isMyanmarRune(rune)) return false;
      found = true;
    }
    return found;
  }

  /// Migration bridge for applications that previously transformed text.
  /// Unicode shaping requires the original string, so this is an identity.
  @Deprecated('Unicode shaping needs the original text. Pass the string directly.')
  String get fix => this;

  static bool _isMyanmarRune(int rune) =>
      (rune >= 0x1000 && rune <= 0x109F) ||
      (rune >= 0xAA60 && rune <= 0xAA7F) ||
      (rune >= 0xA9E0 && rune <= 0xA9FF) ||
      (rune >= 0x116D0 && rune <= 0x116FF);

  static bool _isWhitespace(int rune) =>
      rune == 0x09 || rune == 0x0A || rune == 0x0D || rune == 0x20;
}
