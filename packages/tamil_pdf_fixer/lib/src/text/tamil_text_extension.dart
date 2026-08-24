extension TamilTextExtension on String {
  /// Whether the string contains at least one character from the Tamil
  /// Unicode range used by Tamil text.
  bool get containsTamil => runes.any(_isTamilRune);

  /// Compatibility/readability alias for [containsTamil].
  bool get isTamilText => containsTamil;

  /// Whether every non-whitespace rune belongs to the configured script range.
  ///
  /// This is intentionally strict. Latin punctuation/digits make the result
  /// false. Use [containsTamil] for mixed-script content.
  bool get isTamilOnly {
    var found = false;
    for (final rune in runes) {
      if (_isWhitespace(rune)) continue;
      if (!_isTamilRune(rune)) return false;
      found = true;
    }
    return found;
  }

  /// Migration bridge for applications that previously transformed text.
  /// Unicode shaping requires the original string, so this is an identity.
  @Deprecated('Unicode shaping needs the original text. Pass the string directly.')
  String get fix => this;

  static bool _isTamilRune(int rune) =>
      (rune >= 0x0B80 && rune <= 0x0BFF);

  static bool _isWhitespace(int rune) =>
      rune == 0x09 || rune == 0x0A || rune == 0x0D || rune == 0x20;
}
