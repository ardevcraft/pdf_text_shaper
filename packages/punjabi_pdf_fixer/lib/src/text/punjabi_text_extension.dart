extension PunjabiTextExtension on String {
  /// Whether the string contains at least one character from the Gurmukhi
  /// Unicode range used by Punjabi (Gurmukhi) text.
  bool get containsPunjabi => runes.any(_isPunjabiRune);

  /// Compatibility/readability alias for [containsPunjabi].
  bool get isPunjabiText => containsPunjabi;

  /// Whether every non-whitespace rune belongs to the configured script range.
  ///
  /// This is intentionally strict. Latin punctuation/digits make the result
  /// false. Use [containsPunjabi] for mixed-script content.
  bool get isPunjabiOnly {
    var found = false;
    for (final rune in runes) {
      if (_isWhitespace(rune)) continue;
      if (!_isPunjabiRune(rune)) return false;
      found = true;
    }
    return found;
  }

  /// Migration bridge for applications that previously transformed text.
  /// Unicode shaping requires the original string, so this is an identity.
  @Deprecated('Unicode shaping needs the original text. Pass the string directly.')
  String get fix => this;

  static bool _isPunjabiRune(int rune) =>
      (rune >= 0x0A00 && rune <= 0x0A7F);

  static bool _isWhitespace(int rune) =>
      rune == 0x09 || rune == 0x0A || rune == 0x0D || rune == 0x20;
}
