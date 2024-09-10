import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_images.dart';
import '../../../controllers/auth_controller.dart';

class ProfilePage extends GetView {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AuthController());
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: Get.height * 0.35,
                  width: Get.width,
                  margin: const EdgeInsets.only(bottom: 120),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(50),
                    ),
                    color: Color(0xFF345FB4),
                    image: DecorationImage(
                      image: AssetImage(AppImages.BACKGROUND_PATTERN),
                      fit: BoxFit.cover,
                      opacity: 0.2,
                    ),
                  ),
                ),
                Positioned(
                  top: Get.height * 0.2,
                  child: Container(
                    width: 320,
                    height: Get.height * 0.35,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(30),
                      ),
                      color: Color.fromARGB(255, 150, 177, 229),
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          flex: 1,
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                            child: controller.auth.value.user.picture.isNotEmpty
                                ? Image.network(
                                    controller.auth.value.user.picture,
                                    fit: BoxFit.cover,
                                    width: 200,
                                  )
                                : Image.asset(
                                    AppImages.LOGO_HIMAKOM,
                                    fit: BoxFit.cover,
                                    width: 200,
                                  ),
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment
                                .bottomCenter, // Container akan berada di bagian bawah
                            child: Container(
                              width: double.infinity,
                              height: Get.height,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(30),
                                  bottomLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(30),
                                ),
                                color: AppColors.PRIMARY,
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(top: 10),
                                    child: Text(
                                      controller.auth.value.user.name.isNotEmpty
                                          ? controller.auth.value.user.name
                                              .toUpperCase()
                                          : '-',
                                      style: GoogleFonts.poppins(
                                        color: AppColors.WHITE,
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 1),
                                    child: Text(
                                      controller.auth.value.user.nim.isNotEmpty
                                          ? controller.auth.value.user.nim
                                          : '-',
                                      style: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: 1.5,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 1),
                                    child: Text(
                                      // controller.auth.value.user.nameBagus
                                      //         .isNotEmpty
                                      //     ? controller.auth.value.user.nameBagus
                                      //     : '-',
                                      "-",
                                      style: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  height: 80,
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(
                      top: 20, left: 20, right: 20, bottom: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    // shadow
                    boxShadow: [
                      BoxShadow(
                        color:
                            const Color.fromARGB(255, 0, 0, 0).withOpacity(0.1),
                        spreadRadius: 0,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                    color: AppColors.WHITE,
                  ),
                  child: ListTile(
                      leading: Image.asset(
                        '${controller.menuProfile[index]['icon']}',
                        width: 50,
                        height: 50,
                      ),
                      title: Text('${controller.menuProfile[index]['title']}',
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          )),
                      trailing: const Icon(Icons.arrow_forward_ios,
                          size: 15, color: Colors.black),
                      // tap to navigate
                      onTap: () {
                        // switch case
                        switch (index) {
                          case 0:
                            Get.snackbar(
                              'Info',
                              'Fitur ini belum tersedia',
                              icon: Image.asset(
                                AppImages.ICON_NOTFOUND,
                                width: 25,
                                height: 25,
                              ),
                              backgroundColor: Colors.blue,
                              colorText: Colors.white,
                            );
                            break;
                          case 1:
                            controller.logout();
                            break;
                          default:
                            break;
                        }
                      }),
                );
              },
              childCount: controller.menuProfile.length,
            ),
          ),
        ],
      ),
    );
  }
}
