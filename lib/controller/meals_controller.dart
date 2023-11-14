import 'package:get/get.dart';
import 'package:ns_meal/config/routes/pages.dart';
import 'package:ns_meal/data/remote/core/dio_exceptions.dart';
import 'package:ns_meal/data/remote/model/category.model.dart';
import 'package:ns_meal/data/remote/model/meal.model.dart';
import 'package:ns_meal/data/remote/repository/meal_repository.dart';
import 'package:ns_meal/util/extension/controller.dart';
import 'package:ns_meal/util/strings.dart';

class MealsController extends GetxController {
  RxBool loading = false.obs;
  RxBool hasError = false.obs;
  RxList<Meal> meals = <Meal>[].obs;

  final MealRepository _repository = MealRepository();
  late Category? category;

  @override
  void onInit() {
    category = Get.arguments;
    getMeals();
    super.onInit();
  }

  Future<void> getMeals() async {
    if (category?.strCategory == null) {
      hasError.value = true;
      return;
    }
    try {
      loading.value = true;
      meals.value = await _repository.getMealsOfCategory(category!.strCategory!);
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

  void goToMealDetail(Meal meal) {
    if (meal.idMeal == null) {
      showErrorSnackBar(Strings.notEnoughData);
      return;
    }
    Get.toNamed(
      Pages.mealDetails.toPath,
      arguments: meal,
    );
  }
}
