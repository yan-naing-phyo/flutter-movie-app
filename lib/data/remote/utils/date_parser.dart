class ApiDateParser {
  const ApiDateParser._();

  /// Parse api date string which is in `2024-11-05` format to [DateTime] instance.
  static DateTime? parse(String dateString) {
    return DateTime.tryParse(dateString);
  }
}
