extension IntX on int {
  DateTime ageToDateTime() {
    return DateTime(DateTime.now().year - 1);
  }
}
