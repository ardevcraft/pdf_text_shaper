extension PersianTextExtension on String {
  /// Whether the string contains at least one character from the Persian
  /// Unicode range used by Persian text.
  bool get containsPersian => runes.any(_isPersianRune);

  /// Compatibility/readability alias for [containsPersian].
  bool get isPersianText => containsPersian;

  /// Whether every non-whitespace rune belongs to the configured script range.
  ///
  /// This is intentionally strict. Latin punctuation/digits make the result
  /// false. Use [containsPersian] for mixed-script content.
  bool get isPersianOnly {
    var found = false;
    for (final rune in runes) {
      if (_isWhitespace(rune)) continue;
      if (!_isPersianRune(rune)) return false;
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

  static bool _isPersianRune(int rune) =>
      (rune >= 0x0600 && rune <= 0x06FF) ||
      (rune >= 0x0750 && rune <= 0x077F) ||
      (rune >= 0x08A0 && rune <= 0x08FF) ||
      rune == 0x200C || // Zero-width non-joiner, used in Persian orthography.
      rune == 0x200D;

  static bool _isWhitespace(int rune) =>
      rune == 0x09 || rune == 0x0A || rune == 0x0D || rune == 0x20;
}
