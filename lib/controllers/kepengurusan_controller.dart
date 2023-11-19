import 'package:get/get.dart';
import '../data/providers/kepengurusan_provider.dart';
import '../models/kabinet_model.dart';

class KepengurusanController extends GetxController {
  Rx<KabinetModel> kabinet = KabinetModel(
    id: 0,
    name: '',
    description: '',
    logo: '',
    year: '',
    isActive: 0,
    visi: '',
    misi: '',
    filosofies: [],
    users: [],
    departments: [],
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
    kabinet.value = KabinetModel(
      id: 0,
      name: '',
      description: '',
      logo: '',
      year: '',
      isActive: 0,
      visi: '',
      misi: '',
      filosofies: [],
      users: [],
      departments: [],
    );
    kabinet.value = await KepengurusanProvider().getKabinet();
    isLoading.value = false;
  }
}
