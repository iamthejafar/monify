String getTimePeriod() {
  var now = DateTime.now();
  int hour = now.hour;

  if (hour < 12) {
    return 'Morning';
  } else if (hour < 17) {
    return 'Afternoon';
  } else {
    return 'Evening';
  }
}