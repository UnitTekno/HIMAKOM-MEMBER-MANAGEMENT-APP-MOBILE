import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_images.dart';

import '../../../controllers/events_controller.dart';

import '../../widgets/barDate_widget.dart';
import '../../widgets/dropdown_item.dart';
import '../../widgets/horizontalDate_widget.dart';
import '../../widgets/infoKegiatan_widget.dart';
import '../../widgets/listAcara_widget.dart';

class EventsPage extends GetView {
  const EventsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(EventsController());
    return Scaffold(
      body: Obx(() {
        return RefreshIndicator(
          onRefresh: controller.getData,
          child: controller.isLoading.value
              ? const Center(child: CircularProgressIndicator())
              : Container(
                  decoration: const BoxDecoration(
                    color: AppColors.PRIMARY,
                    image: DecorationImage(
                      image: AssetImage(AppImages.BACKGROUND_PATTERN),
                      fit: BoxFit.cover,
                      opacity: 0.2,
                    ),
                  ),
                  child: Column(
                    children: [
                      SafeArea(
                          child: Column(
                        children: [
                          Container(
                              margin: const EdgeInsets.only(
                                  left: 20, right: 20, top: 10),
                              child: BarDateNowWidget(
                                jumlahKegiatan:
                                    controller.filterDataDate.length,
                              )),
                          Container(
                              margin: const EdgeInsets.only(top: 5, left: 20),
                              child: HorizontalDatePicker(
                                onDateChange: controller.filterDataByDate,
                              ))
                        ],
                      )),
                      Expanded(
                        child: Container(
                            margin: const EdgeInsets.only(top: 15),
                            width: Get.width,
                            decoration: const BoxDecoration(
                              color: AppColors.WHITE,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30),
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InfoKegiatanHimpunan(
                                  jumlahKegiatan:
                                      controller.filterDataDate.length,
                                  listKegiatan: [...controller.filterDataDate],
                                ),
                                DropdownFilter(controller.selectedValue,
                                    controller.filterDataByType),
                                Expanded(
                                  child: ListAcara(
                                    listAcara: [...controller.filterDataType],
                                  ),
                                ),
                              ],
                            )),
                      ),
                    ],
                  ),
                ),
        );
      }),
    );
  }
}
