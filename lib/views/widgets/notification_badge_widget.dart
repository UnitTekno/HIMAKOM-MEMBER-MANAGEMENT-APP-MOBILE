import 'package:HIMAKOM/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationBadge extends StatelessWidget {
  final int totalNotifications;
  final VoidCallback onPressed;

  const NotificationBadge({
    super.key,
    required this.totalNotifications,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: IconButton(
            icon: const Icon(
              Icons.notifications,
              color: AppColors.WHITE,
            ),
            onPressed: onPressed,
          ),
        ),
        if (totalNotifications > 0)
          Positioned(
            right: Get.width * 0.02,
            top: Get.height * 0.02,
            child: Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(10),
              ),
              constraints: const BoxConstraints(
                minWidth: 18,
                minHeight: 18,
              ),
              child: Text(
                '$totalNotifications',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 10,
                  color: AppColors.WHITE,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
