extension GujaratiTextExtension on String {
  /// Whether the string contains at least one character from the Gujarati
  /// Unicode range used by Gujarati text.
  bool get containsGujarati => runes.any(_isGujaratiRune);

  /// Compatibility/readability alias for [containsGujarati].
  bool get isGujaratiText => containsGujarati;

  /// Whether every non-whitespace rune belongs to the configured script range.
  ///
  /// This is intentionally strict. Latin punctuation/digits make the result
  /// false. Use [containsGujarati] for mixed-script content.
  bool get isGujaratiOnly {
    var found = false;
    for (final rune in runes) {
      if (_isWhitespace(rune)) continue;
      if (!_isGujaratiRune(rune)) return false;
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

  static bool _isGujaratiRune(int rune) => (rune >= 0x0A80 && rune <= 0x0AFF);

  static bool _isWhitespace(int rune) =>
      rune == 0x09 || rune == 0x0A || rune == 0x0D || rune == 0x20;
}
