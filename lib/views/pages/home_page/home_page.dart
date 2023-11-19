import 'package:HIMAKOM/controllers/notification_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_images.dart';
import '../../../controllers/auth_controller.dart';
import '../../../controllers/kepengurusan_controller.dart';
import '../../../routes/app_routes.dart';
import '../../widgets/appBar_widget.dart';
import '../../widgets/departments_widget.dart';
import '../../widgets/drawCLip_widget.dart';
import '../../widgets/notification_badge_widget.dart';
import '../../widgets/pengurus_widget.dart';

class HomePage extends GetView<AuthController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<KepengurusanController>();
    final controllerAuth = Get.find<AuthController>();
    final controllerNotif = Get.find<NotificationController>();
    return Obx(() {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.PRIMARY,
          automaticallyImplyLeading: false,
          toolbarHeight: 80,
          elevation: 2,
          title: ProfileAppbar(user: controllerAuth.auth.value.user),
          actions: [
            NotificationBadge(
              totalNotifications: controllerNotif.totalNotifications.value,
              onPressed: () {
                Get.toNamed(RouteName.notificationRoute);
              },
            ),
          ],
        ),
        body: RefreshIndicator(
          onRefresh: controller.getKepengurusan,
          child: (controller.isLoading.value == true) ||
                  (controllerAuth.isLoading.value == true)
              ? const Center(child: CircularProgressIndicator())
              : ListView(children: [
                  ClipPath(
                    clipper: DrawClip(),
                    child: Container(
                        height: Get.height * 0.4,
                        decoration: const BoxDecoration(
                          color: AppColors.PRIMARY,
                          image: DecorationImage(
                            image: AssetImage(AppImages.BACKGROUND_PATTERN),
                            fit: BoxFit.cover,
                            opacity: 0.2,
                          ),
                        ),
                        child: CarouselSlider(
                          options: CarouselOptions(
                            height: 500,
                            enlargeCenterPage: true,
                            viewportFraction: 0.5,
                            enableInfiniteScroll: false,
                          ),
                          items: controller.kabinet.value.users.map((item) {
                            final index =
                                controller.kabinet.value.users.indexOf(item);
                            return Pengurus(
                              avatar:
                                  controller.kabinet.value.users[index].picture,
                              name: controller.kabinet.value.users[index].name,
                              role: controller
                                  .kabinet.value.users[index].roleName,
                            );
                          }).toList(),
                        )),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      children: [
                        Container(
                          // margin: const EdgeInsets.only(bottom),
                          alignment: Alignment.topCenter,
                          child:
                              Text("Kabinet ${controller.kabinet.value.name}",
                                  style: GoogleFonts.poppins(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center),
                        ),
                        Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(bottom: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                // border: Border.all(color: Colors.white, width: 2),
                              ),
                              child: ClipOval(
                                child: SizedBox(
                                  width: 150,
                                  height: 150,
                                  child: Image.network(
                                    controller.kabinet.value.logo,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(bottom: 20),
                              padding: const EdgeInsets.only(
                                  left: 20, right: 20, top: 10, bottom: 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 5,
                                      offset: Offset(0, 5),
                                    ),
                                  ],
                                  color: AppColors.WHITE),
                              child: CarouselSlider(
                                options: CarouselOptions(
                                  height: 150,
                                  viewportFraction: 1,
                                  autoPlay: true,
                                ),
                                items: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    width: Get.width,
                                    child: SingleChildScrollView(
                                      child: Column(
                                        children: [
                                          Text(
                                            'Visi',
                                            style: GoogleFonts.poppins(
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            controller.kabinet.value.visi,
                                            style: GoogleFonts.poppins(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    width: Get.width,
                                    child: SingleChildScrollView(
                                      child: Column(
                                        children: [
                                          Text(
                                            'Misi',
                                            style: GoogleFonts.poppins(
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            controller.kabinet.value.misi,
                                            style: GoogleFonts.poppins(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 20),
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 10, bottom: 10),
                          height: Get.height * 0.5,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 5,
                                  offset: Offset(0, 5),
                                ),
                              ],
                              color: AppColors.WHITE),
                          child: Column(
                            children: [
                              Text(
                                'Filosofi Logo Kabinet',
                                style: GoogleFonts.poppins(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                height: Get.height * 0.4,
                                child: ListView.builder(
                                  itemCount: controller
                                      .kabinet.value.filosofies.length,
                                  itemBuilder: (context, index) {
                                    final filosofiItem = controller
                                        .kabinet.value.filosofies[index];
                                    return ListTile(
                                      leading: ClipOval(
                                        child: SizedBox(
                                          width: 50,
                                          height: 50,
                                          child: Image.network(
                                            controller.kabinet.value
                                                .filosofies[index].logo,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      title: Text(
                                        filosofiItem.label,
                                        style: GoogleFonts.poppins(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 20),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 5,
                                  offset: Offset(0, 5),
                                ),
                              ],
                              color: AppColors.WHITE),
                          child: Column(
                            children: [
                              Text(
                                "Departemen",
                                style: GoogleFonts.poppins(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              CarouselSlider(
                                  options: CarouselOptions(
                                    height: 150,
                                    viewportFraction: 0.35,
                                    autoPlay: true,
                                    initialPage: 1,
                                  ),
                                  items: controller.kabinet.value.departments
                                      .map((item) {
                                    final index = controller
                                        .kabinet.value.departments
                                        .indexOf(item);
                                    return Departments(
                                      name: controller.kabinet.value
                                          .departments[index].shortName,
                                      logo: controller.kabinet.value
                                          .departments[index].logo,
                                    );
                                  }).toList()),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
        ),
      );
    });
  }
}
