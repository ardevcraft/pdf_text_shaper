extension SinhalaTextExtension on String {
  /// Whether the string contains at least one character from the Sinhala
  /// Unicode range used by Sinhala text.
  bool get containsSinhala => runes.any(_isSinhalaRune);

  /// Compatibility/readability alias for [containsSinhala].
  bool get isSinhalaText => containsSinhala;

  /// Whether every non-whitespace rune belongs to the configured script range.
  ///
  /// This is intentionally strict. Latin punctuation/digits make the result
  /// false. Use [containsSinhala] for mixed-script content.
  bool get isSinhalaOnly {
    var found = false;
    for (final rune in runes) {
      if (_isWhitespace(rune)) continue;
      if (!_isSinhalaRune(rune)) return false;
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

  static bool _isSinhalaRune(int rune) =>
      (rune >= 0x0D80 && rune <= 0x0DFF) ||
      (rune >= 0x111E0 && rune <= 0x111FF);

  static bool _isWhitespace(int rune) =>
      rune == 0x09 || rune == 0x0A || rune == 0x0D || rune == 0x20;
}
