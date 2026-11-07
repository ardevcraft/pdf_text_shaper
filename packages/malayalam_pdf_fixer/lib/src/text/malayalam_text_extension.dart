extension MalayalamTextExtension on String {
  /// Whether the string contains at least one character from the Malayalam
  /// Unicode range used by Malayalam text.
  bool get containsMalayalam => runes.any(_isMalayalamRune);

  /// Compatibility/readability alias for [containsMalayalam].
  bool get isMalayalamText => containsMalayalam;

  /// Whether every non-whitespace rune belongs to the configured script range.
  ///
  /// This is intentionally strict. Latin punctuation/digits make the result
  /// false. Use [containsMalayalam] for mixed-script content.
  bool get isMalayalamOnly {
    var found = false;
    for (final rune in runes) {
      if (_isWhitespace(rune)) continue;
      if (!_isMalayalamRune(rune)) return false;
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

  static bool _isMalayalamRune(int rune) => (rune >= 0x0D00 && rune <= 0x0D7F);

  static bool _isWhitespace(int rune) =>
      rune == 0x09 || rune == 0x0A || rune == 0x0D || rune == 0x20;
}
