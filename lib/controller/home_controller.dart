import 'package:get/get.dart';
import 'package:ns_meal/config/routes/pages.dart';
import 'package:ns_meal/data/remote/core/dio_exceptions.dart';
import 'package:ns_meal/data/remote/model/category.model.dart';
import 'package:ns_meal/data/remote/repository/meal_repository.dart';
import 'package:ns_meal/util/extension/controller.dart';
import 'package:ns_meal/util/strings.dart';

class HomeController extends GetxController {
  final MealRepository _repository = MealRepository();
  RxBool loading = false.obs;
  RxBool hasError = false.obs;
  RxList<Category> categories = <Category>[].obs;

  @override
  void onInit() {
    getCategories();
    super.onInit();
  }

  Future<void> getCategories() async {
    try {
      loading.value = true;
      categories.value = await _repository.getCategories();
    } on DioExceptions catch (e) {
      showErrorSnackBar(e.message);
      hasError.value = true;
    } catch (e) {
      showErrorSnackBar(Strings.failedToFetchCategories);
      hasError.value = true;
    } finally {
      loading.value = false;
    }
  }

  void retry() {
    hasError.value = false;
    getCategories();
  }

  void goToMeals(String? strCategory) {
    if (strCategory == null) {
      showErrorSnackBar(Strings.notEnoughData);
      return;
    }
    Get.toNamed(Pages.meals.toPath, parameters: {'category': strCategory});
  }
}
