import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_images.dart';
import '../../../controllers/auth_controller.dart';
import '../../../controllers/kepengurusan_controller.dart';
import '../../widgets/appBar_widget.dart';
import '../../widgets/departments_widget.dart';
import '../../widgets/drawCLip_widget.dart';
import '../../widgets/pengurus_widget.dart';

class HomePage extends GetView<AuthController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<KepengurusanController>();
    final controllerAuth = Get.find<AuthController>();
    return Obx(() {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.PRIMARY,
          automaticallyImplyLeading: false,
          toolbarHeight: 80,
          elevation: 2,
          title: ProfileAppbar(user: controllerAuth.auth.value.user),
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
                          items: controller.kepengurusan.value.data.map((item) {
                            final index = controller.kepengurusan.value.data
                                .indexOf(item);
                            return Pengurus(
                              avatar: controller
                                  .kepengurusan.value.data[index].avatar,
                              name: controller
                                  .kepengurusan.value.data[index].name,
                              role: controller
                                  .kepengurusan.value.data[index].role,
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
                          child: Text(
                              "Kabinet ${controller.kabinet.value.data[0].name}",
                              style: GoogleFonts.poppins(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      backgroundColor: Colors.transparent,
                                      content: SizedBox(
                                        child: Image.network(
                                          controller
                                              .kabinet.value.data[0].filosofy,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                              child: Container(
                                margin: const EdgeInsets.only(bottom: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  // border: Border.all(color: Colors.white, width: 2),
                                ),
                                child: Stack(
                                  children: [
                                    ClipOval(
                                      child: SizedBox(
                                        width: 150,
                                        height: 150,
                                        child: Image.network(
                                          controller.kabinet.value.data[0].logo,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      right: 0,
                                      child: Container(
                                        padding: const EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          color: AppColors.PRIMARY,
                                        ),
                                        child: const Icon(
                                          Icons.info,
                                          color: AppColors.WHITE,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(bottom: 20),
                              padding: const EdgeInsets.only(
                                  left: 20, right: 20, top: 10),
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
                                            controller
                                                .kabinet.value.data[0].visi,
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
                                            controller
                                                .kabinet.value.data[0].misi,
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
                                  items: controller.departments.value.data
                                      .map((item) {
                                    final index = controller
                                        .departments.value.data
                                        .indexOf(item);
                                    return Departments(
                                      name: controller.departments.value
                                          .data[index].shortName,
                                      logo: controller
                                          .departments.value.data[index].logo,
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
