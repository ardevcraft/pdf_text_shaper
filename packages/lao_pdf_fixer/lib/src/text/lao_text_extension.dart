extension LaoTextExtension on String {
  /// Whether the string contains at least one character from the Lao
  /// Unicode range used by Lao text.
  bool get containsLao => runes.any(_isLaoRune);

  /// Compatibility/readability alias for [containsLao].
  bool get isLaoText => containsLao;

  /// Whether every non-whitespace rune belongs to the configured script range.
  ///
  /// This is intentionally strict. Latin punctuation/digits make the result
  /// false. Use [containsLao] for mixed-script content.
  bool get isLaoOnly {
    var found = false;
    for (final rune in runes) {
      if (_isWhitespace(rune)) continue;
      if (!_isLaoRune(rune)) return false;
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

  static bool _isLaoRune(int rune) => (rune >= 0x0E80 && rune <= 0x0EFF);

  static bool _isWhitespace(int rune) =>
      rune == 0x09 || rune == 0x0A || rune == 0x0D || rune == 0x20;
}
