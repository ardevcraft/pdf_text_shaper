extension KhmerTextExtension on String {
  /// Whether the string contains at least one character from the Khmer
  /// Unicode range used by Khmer text.
  bool get containsKhmer => runes.any(_isKhmerRune);

  /// Compatibility/readability alias for [containsKhmer].
  bool get isKhmerText => containsKhmer;

  /// Whether every non-whitespace rune belongs to the configured script range.
  ///
  /// This is intentionally strict. Latin punctuation/digits make the result
  /// false. Use [containsKhmer] for mixed-script content.
  bool get isKhmerOnly {
    var found = false;
    for (final rune in runes) {
      if (_isWhitespace(rune)) continue;
      if (!_isKhmerRune(rune)) return false;
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

  static bool _isKhmerRune(int rune) =>
      (rune >= 0x1780 && rune <= 0x17FF) || (rune >= 0x19E0 && rune <= 0x19FF);

  static bool _isWhitespace(int rune) =>
      rune == 0x09 || rune == 0x0A || rune == 0x0D || rune == 0x20;
}
