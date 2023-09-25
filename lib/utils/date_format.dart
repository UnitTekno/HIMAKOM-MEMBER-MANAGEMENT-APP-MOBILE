import 'package:intl/intl.dart';

String dateFormat(DateTime date) {
  DateFormat dateFormat = DateFormat("EEEE, MMMM-dd-yyyy", "id_ID");
  return dateFormat.format(date);
}

int dateOnly(DateTime date) {
  DateFormat dateFormat = DateFormat("dd");
  return int.parse(dateFormat.format(date));
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

String dayLeft(DateTime date) {
  int dayLeft = dayLeftInt(date) - dayLeftInt(DateTime.now());

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
