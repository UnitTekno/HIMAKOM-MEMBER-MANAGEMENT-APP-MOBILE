import 'package:intl/intl.dart';

String dateFormat(DateTime date) {
  DateFormat dateFormat = DateFormat("EEEE, MMMM-dd-yyyy", "id_ID");
  return dateFormat.format(date);
}

int dateOnly(DateTime date) {
  DateFormat dateFormat = DateFormat("dd");
  return int.parse(dateFormat.format(date));
}

String dayLeft(DateTime date) {
  int dateNow = dateOnly(DateTime.now());
  int dateEvent = dateOnly(date);
  int dayLeft = dateEvent - dateNow;

  if (dayLeft == 0) {
    return "Hari ini";
  } else if (dayLeft == 1) {
    return "Besok";
  } else if (dayLeft == -1) {
    return "Kemarin";
  } else if (dayLeft > 1) {
    return "Dalam $dayLeft hari";
  } else if (dayLeft < -1) {
    return "$dayLeft hari yang lalu";
  } else {
    return "";
  }
}

int dayLeftInt(DateTime eventDate) {
  final currentDate = DateTime.now();
  final eventDateOnly =
      DateTime(eventDate.year, eventDate.month, eventDate.day);
  final currentDateOnly =
      DateTime(currentDate.year, currentDate.month, currentDate.day);

  final difference = eventDateOnly.difference(currentDateOnly);
  final daysLeft = difference.inDays;

  return daysLeft;
}
