import 'package:get/get.dart';
import 'package:ns_meal/data/remote/core/dio_exceptions.dart';
import 'package:ns_meal/data/remote/model/meal.model.dart';
import 'package:ns_meal/data/remote/repository/meal_repository.dart';
import 'package:ns_meal/util/extension/controller.dart';
import 'package:ns_meal/util/strings.dart';

class MealsController extends GetxController {
  RxBool loading = false.obs;
  RxBool hasError = false.obs;
  RxList<Meal> meals = <Meal>[].obs;

  final MealRepository _repository = MealRepository();
  late String category;

  @override
  void onInit() {
    category = Get.parameters['category'] ?? Strings.emptyString;
    getMeals();
    super.onInit();
  }

  Future<void> getMeals() async {
    if (category.isEmpty) {
      hasError.value = true;
      return;
    }
    try {
      loading.value = true;
      meals.value = await _repository.getMealsOfCategory(category);
    } on DioExceptions catch (e) {
      showErrorSnackBar(e.message);
      hasError.value = true;
    } catch (e) {
      showErrorSnackBar(Strings.failedToFetchMeals);
      hasError.value = true;
    } finally {
      loading.value = false;
    }
  }

  void retry() {
    hasError.value = false;
    getMeals();
  }
}
