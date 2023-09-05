import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_images.dart';

class DepartmentsPage extends GetView {
  const DepartmentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppImages.ICON_NOTFOUND,
              width: 100,
              height: 100,
            ),
            Text(
              'Tahap Pengembangan',
              style: GoogleFonts.poppins(
                fontSize: 16,
                color: AppColors.BLACK,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
