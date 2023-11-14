import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:ns_meal/data/remote/model/category.model.dart';
import 'package:ns_meal/data/remote/repository/meal_repository.dart';
import 'package:ns_meal/util/extension/controller.dart';

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
    } on DioException catch (e) {
      showErrorSnackBar(e.message);
      hasError.value = true;
    } catch (e) {
      showErrorSnackBar('Failed to fetch the categories');
      hasError.value = true;
    } finally {
      loading.value = false;
    }
  }

  void retry() {
    hasError.value = false;
    getCategories();
  }
}
