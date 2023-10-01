import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../constants/app_colors.dart';
import '../../../../controllers/notification_controller.dart';

class NotificationPage extends GetView {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = Get.width;
    final screenHeight = Get.height;
    final controller = Get.find<NotificationController>();
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: AppColors.PRIMARY,
        title: Text(
          'Notifikasi',
          style: GoogleFonts.poppins(
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Obx(() {
        return ListView.builder(
          itemBuilder: (context, index) {
            return Dismissible(
              key: UniqueKey(),
              direction: DismissDirection.endToStart,
              onDismissed: (direction) {
                controller.notificationRead(
                    controller.notificationsInfo.value.data[index].id);
              },
              background: Container(
                color: AppColors.RED,
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.only(right: 20),
                child: const Icon(
                  Icons.delete,
                  color: AppColors.WHITE,
                ),
              ),
              child: Container(
                height: screenHeight * 0.15,
                margin: const EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.WHITE,
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromARGB(40, 0, 0, 0),
                      offset: Offset(0, 4),
                      blurRadius: 2,
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        alignment: Alignment.centerLeft,
                        width: screenWidth * 0.2,
                        child: Image.network(
                          controller.notificationsInfo.value.data[index].poster,
                          fit: BoxFit.cover,
                          height: double.infinity,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Container(
                        margin: const EdgeInsets.only(left: 10),
                        padding: const EdgeInsets.only(top: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(bottom: 10),
                              child: Text(
                                  controller.notificationsInfo.value.data[index]
                                      .title,
                                  style: GoogleFonts.poppins(
                                      color: AppColors.BLACK,
                                      fontSize: screenWidth * 0.05,
                                      fontWeight: FontWeight.bold),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1),
                            ),
                            Container(
                              margin: const EdgeInsets.only(bottom: 10),
                              child: Text(
                                controller
                                    .notificationsInfo.value.data[index].body,
                                style: GoogleFonts.poppins(
                                  color: const Color.fromARGB(255, 94, 94, 94),
                                  fontSize: screenWidth * 0.03,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          itemCount: controller.notificationsInfo.value.data.length,
        );
      }),
    );
  }
}
