

String parseBacYearFromUsername(String username) {
  return username.substring(0, 4);
}

String parseBacNumberFromUsername(String username) {
  return username.substring(4, username.length);
}