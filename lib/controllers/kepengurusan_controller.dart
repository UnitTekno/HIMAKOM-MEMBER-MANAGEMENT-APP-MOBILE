import 'package:get/get.dart';
import '../data/providers/kepengurusan_provider.dart';
import '../models/departments_model.dart';
import '../models/kabinet_model.dart';
import '../models/kepengurusan_model.dart';

class KepengurusanController extends GetxController {
  Rx<KepengurusanModel> kepengurusan = KepengurusanModel(
    status: '',
    data: [],
  ).obs;
  Rx<KabinetModel> kabinet = KabinetModel(
    status: '',
    data: [],
  ).obs;
  Rx<DepartmentsModel> departments = DepartmentsModel(
    status: '',
    data: [],
  ).obs;
  RxInt selectedDepartment = 0.obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    getKepengurusan();
    super.onInit();
  }

  @override
  void onClose() {}

  Future<void> getKepengurusan() async {
    isLoading.value = true;
    // clear data
    kepengurusan.value = KepengurusanModel(
      status: '',
      data: [],
    );
    kabinet.value = KabinetModel(
      status: '',
      data: [],
    );
    departments.value = DepartmentsModel(
      status: '',
      data: [],
    );
    kepengurusan.value = await KepengurusanProvider().getKepengurusan();
    kabinet.value = await KepengurusanProvider().getKabinet();
    departments.value = await KepengurusanProvider().getDepartments();
    isLoading.value = false;
  }
}
