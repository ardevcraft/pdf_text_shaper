extension ThaiTextExtension on String {
  /// Whether the string contains at least one character from the Thai
  /// Unicode range used by Thai text.
  bool get containsThai => runes.any(_isThaiRune);

  /// Compatibility/readability alias for [containsThai].
  bool get isThaiText => containsThai;

  /// Whether every non-whitespace rune belongs to the configured script range.
  ///
  /// This is intentionally strict. Latin punctuation/digits make the result
  /// false. Use [containsThai] for mixed-script content.
  bool get isThaiOnly {
    var found = false;
    for (final rune in runes) {
      if (_isWhitespace(rune)) continue;
      if (!_isThaiRune(rune)) return false;
      found = true;
    }
    return found;
  }

  /// Migration bridge for applications that previously transformed text.
  /// Unicode shaping requires the original string, so this is an identity.
  @Deprecated(
    'Unicode shaping needs the original text. Pass the string directly.',
  )
  String get fix => this;

  static bool _isThaiRune(int rune) => (rune >= 0x0E00 && rune <= 0x0E7F);

  static bool _isWhitespace(int rune) =>
      rune == 0x09 || rune == 0x0A || rune == 0x0D || rune == 0x20;
}
