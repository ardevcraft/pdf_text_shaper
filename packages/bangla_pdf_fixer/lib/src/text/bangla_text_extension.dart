extension BanglaTextExtension on String {
  /// Whether the string contains at least one character from the Bengali
  /// Unicode range used by Bangla/Bengali text.
  bool get containsBangla => runes.any(_isBanglaRune);

  /// Compatibility/readability alias for [containsBangla].
  bool get isBanglaText => containsBangla;

  /// Whether every non-whitespace rune belongs to the configured script range.
  ///
  /// This is intentionally strict. Latin punctuation/digits make the result
  /// false. Use [containsBangla] for mixed-script content.
  bool get isBanglaOnly {
    var found = false;
    for (final rune in runes) {
      if (_isWhitespace(rune)) continue;
      if (!_isBanglaRune(rune)) return false;
      found = true;
    }
    return found;
  }

  /// Migration bridge for applications that previously transformed text.
  /// Unicode shaping requires the original string, so this is an identity.
  @Deprecated('Unicode shaping needs the original text. Pass the string directly.')
  String get fix => this;

  static bool _isBanglaRune(int rune) =>
      (rune >= 0x0980 && rune <= 0x09FF);

  static bool _isWhitespace(int rune) =>
      rune == 0x09 || rune == 0x0A || rune == 0x0D || rune == 0x20;
}
