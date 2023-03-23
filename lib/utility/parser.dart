

String parseBacYearFromUsername(String username) {
  return username.substring(0, 4);
}

String parseBacNumberFromUsername(String username) {
  return username.substring(4, username.length);
}

String dateTimeToDateDisplay(DateTime dateTime) {
  return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
}

String dateTimeStringToDisplay(String dateTimeString) {
  final dateTime = DateTime.parse(dateTimeString);
  return dateTimeToDateDisplay(dateTime);
}