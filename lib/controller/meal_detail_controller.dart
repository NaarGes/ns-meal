import 'package:get/get.dart';
import 'package:ns_meal/data/remote/core/dio_exceptions.dart';
import 'package:ns_meal/data/remote/model/meal_detail.model.dart';
import 'package:ns_meal/data/remote/repository/meal_repository.dart';
import 'package:ns_meal/util/extension/controller.dart';
import 'package:ns_meal/util/strings.dart';

class MealDetailController extends GetxController {

  RxBool loading = false.obs;
  RxBool hasError = false.obs;
  RxList<MealDetail> details = <MealDetail>[].obs;

  final MealRepository _repository = MealRepository();

  late String mealId;

  @override
  void onInit() {
    mealId = Get.parameters['meal'] ?? Strings.emptyString;
    getMealDetail();
    super.onInit();
  }

  Future<void> getMealDetail() async {
    if (mealId.isEmpty) {
      hasError.value = true;
      return;
    }
    try {
      loading.value = true;
      details.value = await _repository.getMealDetail(mealId);
    } on DioExceptions catch (e) {
      showErrorSnackBar(e.message);
      hasError.value = true;
    } catch (e) {
      showErrorSnackBar(Strings.failedToFetchMealDetail);
      hasError.value = true;
    } finally {
      loading.value = false;
    }
  }

  void retry() {
    hasError.value = false;
    getMealDetail();
  }
}