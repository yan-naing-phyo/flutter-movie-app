class DateParser {
  const DateParser._();

  static DateTime? parse(String dateString) {
    return DateTime.tryParse(dateString);
  }
}
