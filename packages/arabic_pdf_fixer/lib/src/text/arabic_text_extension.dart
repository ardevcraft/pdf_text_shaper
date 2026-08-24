extension ArabicTextExtension on String {
  /// Whether the string contains at least one character from the Arabic
  /// Unicode range used by Arabic text.
  bool get containsArabic => runes.any(_isArabicRune);

  /// Compatibility/readability alias for [containsArabic].
  bool get isArabicText => containsArabic;

  /// Whether every non-whitespace rune belongs to the configured script range.
  ///
  /// This is intentionally strict. Latin punctuation/digits make the result
  /// false. Use [containsArabic] for mixed-script content.
  bool get isArabicOnly {
    var found = false;
    for (final rune in runes) {
      if (_isWhitespace(rune)) continue;
      if (!_isArabicRune(rune)) return false;
      found = true;
    }
    return found;
  }

  /// Migration bridge for applications that previously transformed text.
  /// Unicode shaping requires the original string, so this is an identity.
  @Deprecated('Unicode shaping needs the original text. Pass the string directly.')
  String get fix => this;

  static bool _isArabicRune(int rune) =>
      (rune >= 0x0600 && rune <= 0x06FF) ||
      (rune >= 0x0750 && rune <= 0x077F) ||
      (rune >= 0x08A0 && rune <= 0x08FF);

  static bool _isWhitespace(int rune) =>
      rune == 0x09 || rune == 0x0A || rune == 0x0D || rune == 0x20;
}
