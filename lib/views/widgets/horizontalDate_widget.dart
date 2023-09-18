// ignore_for_file: file_names

import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/app_colors.dart';

class HorizontalDatePicker extends StatelessWidget {
  final Function(DateTime) onDateChange;

  const HorizontalDatePicker({Key? key, required this.onDateChange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DatePicker(
      DateTime.now(),
      width: Get.width * 0.2,
      height: Get.height * 0.15,
      initialSelectedDate: DateTime.now(),
      selectionColor: Colors.white,
      selectedTextColor: Colors.black,
      dateTextStyle: GoogleFonts.poppins(
          color: AppColors.WHITE,
          fontSize: Get.height < 700 ? Get.width * 0.04 : Get.width * 0.05,
          fontWeight: FontWeight.bold),
      dayTextStyle: GoogleFonts.poppins(
          color: AppColors.WHITE,
          fontSize: Get.height < 700 ? Get.width * 0.04 : Get.width * 0.05,
          fontWeight: FontWeight.bold),
      monthTextStyle: GoogleFonts.poppins(
          color: AppColors.WHITE,
          fontSize: Get.height < 700 ? Get.width * 0.04 : Get.width * 0.05,
          fontWeight: FontWeight.bold),
      locale: 'id',
      onDateChange: (date) {
        onDateChange(date);
      },
    );
  }
}
