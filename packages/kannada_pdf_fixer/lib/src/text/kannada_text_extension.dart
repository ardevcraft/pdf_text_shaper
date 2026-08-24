extension KannadaTextExtension on String {
  /// Whether the string contains at least one character from the Kannada
  /// Unicode range used by Kannada text.
  bool get containsKannada => runes.any(_isKannadaRune);

  /// Compatibility/readability alias for [containsKannada].
  bool get isKannadaText => containsKannada;

  /// Whether every non-whitespace rune belongs to the configured script range.
  ///
  /// This is intentionally strict. Latin punctuation/digits make the result
  /// false. Use [containsKannada] for mixed-script content.
  bool get isKannadaOnly {
    var found = false;
    for (final rune in runes) {
      if (_isWhitespace(rune)) continue;
      if (!_isKannadaRune(rune)) return false;
      found = true;
    }
    return found;
  }

  /// Migration bridge for applications that previously transformed text.
  /// Unicode shaping requires the original string, so this is an identity.
  @Deprecated('Unicode shaping needs the original text. Pass the string directly.')
  String get fix => this;

  static bool _isKannadaRune(int rune) =>
      (rune >= 0x0C80 && rune <= 0x0CFF);

  static bool _isWhitespace(int rune) =>
      rune == 0x09 || rune == 0x0A || rune == 0x0D || rune == 0x20;
}
