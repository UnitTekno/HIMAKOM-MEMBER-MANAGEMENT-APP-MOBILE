import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_images.dart';

// Import Controller
import '../../../controllers/auth_controller.dart';

import '../../../utils/custom_text.dart';

class AuthPage extends GetView<AuthController> {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return Container(
          height: Get.height,
          width: Get.width,
          decoration: const BoxDecoration(
            color: AppColors.PRIMARY,
            image: DecorationImage(
                image: AssetImage(AppImages.BACKGROUND_PATTERN),
                fit: BoxFit.cover,
                opacity: 0.2),
          ),
          child: Stack(
            children: [
              SizedBox(
                height: Get.height * 0.5,
                width: Get.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 130,
                      width: 130,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(AppImages.LOGO_HIMAKOM),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    CustomText(
                      text: 'HIMAKOM',
                      color: AppColors.WHITE,
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                    ).build(),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: Get.height * 0.5,
                  width: Get.width,
                  decoration: const BoxDecoration(
                    color: AppColors.WHITE,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 20, left: 20),
                        alignment: Alignment.centerLeft,
                        child: CustomText(
                                text: 'Hi, HIMAKOM',
                                color: AppColors.BLACK,
                                fontSize: 30,
                                fontWeight: FontWeight.bold)
                            .build(),
                      ),
                      Container(
                        margin:
                            const EdgeInsets.only(top: 20, left: 20, right: 20),
                        child: TextField(
                          controller: controller.emailController,
                          decoration: InputDecoration(
                              labelText: 'Email',
                              labelStyle: GoogleFonts.poppins(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                      ),
                      Container(
                        margin:
                            const EdgeInsets.only(top: 20, left: 20, right: 20),
                        child: TextField(
                          controller: controller.passwordController,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            labelStyle: GoogleFonts.poppins(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                controller.isPasswordVisible.value
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                              onPressed: () {
                                controller.showHidePassword();
                              },
                            ),
                          ),
                          obscureText: !controller.isPasswordVisible.value,
                        ),
                      ),
                      Container(
                        margin:
                            const EdgeInsets.only(top: 40, left: 20, right: 20),
                        height: 50,
                        width: Get.width,
                        child: ElevatedButton(
                          onPressed: controller.isLoading.value
                              ? null
                              : () {
                                  controller.login(
                                    controller.emailController.text,
                                    controller.passwordController.text,
                                  );
                                },
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(AppColors.PRIMARY),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          child: controller.isLoading.value
                              ? SizedBox(
                                  height: 25,
                                  width: 25,
                                  child: controller.isLoginSuccess.value
                                      ? Container(
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: AppColors.GREEN,
                                          ),
                                          child: const Center(
                                            child: Icon(
                                              Icons.done,
                                              color: AppColors.WHITE,
                                              size: 20,
                                            ),
                                          ),
                                        )
                                      : controller.isLoginFail.value
                                          ? Container(
                                              decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: AppColors.RED,
                                              ),
                                              child: const Center(
                                                child: Icon(
                                                  Icons.close,
                                                  color: AppColors.WHITE,
                                                  size: 20,
                                                ),
                                              ),
                                            )
                                          : const CircularProgressIndicator(
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                      AppColors.WHITE),
                                              strokeWidth: 3,
                                            ),
                                )
                              : CustomText(
                                  text: 'Login',
                                  color: AppColors.WHITE,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ).build(),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(AppImages.BACKGROUND_VECTOR),
                              fit: BoxFit.fitWidth,
                              alignment: Alignment.bottomCenter,
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
        );
      }),
    );
  }
}
