
bool compareDateTime(String dateString) {

  DateTime now = DateTime.now();


  DateTime date = DateTime.parse(dateString);

  if (now.isBefore(date)) {
    return true;
  } else if (now.isAfter(date)) {
    return false;
  } else {
    return true;
  }
}