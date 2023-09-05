// ignore_for_file: avoid_print

import 'package:get/get.dart';

import '../data/providers/events_provider.dart';
import '../models/events_model.dart';

class EventsController extends GetxController {
  Rx<EventsModel> events = EventsModel(status: '', events: []).obs;
  RxList<dynamic> filterDataType = [].obs;
  RxList<dynamic> filterDataDate = [].obs;
  RxBool isLoading = true.obs;
  RxBool isExpanded = false.obs;
  String? selectedValue;

  @override
  void onInit() {
    super.onInit();
    getData();
  }

  // @override
  // void onClose() {}

  Future<void> getData() async {
    try {
      isLoading.value = true;
      events.value = await EventsProvider().getEvents();
      isLoading.value = false;
      filterDataByDate(DateTime.now());
      filterDataByType('Semua');
    } catch (error) {
      print(error);
    }
  }

  // Filter data berdasarkan value dari dropdown
  void filterDataByType(String value) async {
    if (value == 'Semua') {
      filterDataType.assignAll(events.value.events);
    } else {
      filterDataType.assignAll(events.value.events
          .where((element) => element.type == value)
          .toList());
    }
    await Future.delayed(const Duration(milliseconds: 500));
  }

  // Filter data berdasarkan value dari datepicker
  void filterDataByDate(DateTime value) async {
    String date = value.toString().substring(0, 10);
    filterDataDate.assignAll(events.value.events
        .where((element) =>
            element.date.toString().substring(0, 10) == date &&
            element.type != 'pekerjaan')
        .toList());
    await Future.delayed(const Duration(milliseconds: 500));
  }
}
