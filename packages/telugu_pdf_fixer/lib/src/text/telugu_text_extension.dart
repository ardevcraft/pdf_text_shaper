extension TeluguTextExtension on String {
  /// Whether the string contains at least one character from the Telugu
  /// Unicode range used by Telugu text.
  bool get containsTelugu => runes.any(_isTeluguRune);

  /// Compatibility/readability alias for [containsTelugu].
  bool get isTeluguText => containsTelugu;

  /// Whether every non-whitespace rune belongs to the configured script range.
  ///
  /// This is intentionally strict. Latin punctuation/digits make the result
  /// false. Use [containsTelugu] for mixed-script content.
  bool get isTeluguOnly {
    var found = false;
    for (final rune in runes) {
      if (_isWhitespace(rune)) continue;
      if (!_isTeluguRune(rune)) return false;
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

  static bool _isTeluguRune(int rune) => (rune >= 0x0C00 && rune <= 0x0C7F);

  static bool _isWhitespace(int rune) =>
      rune == 0x09 || rune == 0x0A || rune == 0x0D || rune == 0x20;
}
