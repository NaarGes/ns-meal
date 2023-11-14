import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:ns_meal/data/remote/core/dio_client.dart';
import 'package:ns_meal/data/remote/core/endpoints.dart';
import 'package:ns_meal/data/remote/model/category.model.dart';
import 'package:ns_meal/data/remote/model/meal.model.dart';
import 'package:ns_meal/data/remote/model/meal_detail.model.dart';

class MealRepository {
  final DioClient _dioClient = DioClient();

  Future<List<Category>> getCategories() async {
    try {
      Response response = await _dioClient.get(Endpoints.categories);
      List<Category> categories = [];
      response.data['categories']?.forEach((json) {
        categories.add(Category.fromJson(json));
      });
      return categories;
    } catch (e) {
      Logger().e(e);
      rethrow;
    }
  }

  Future<List<Meal>> getMealsOfCategory(String strCategory) async {
    try {
      Response response = await _dioClient.get(Endpoints.meals, queryParameters: {
        'c': strCategory,
      });
      List<Meal> meals = [];
      response.data['meals']?.forEach((json) {
        meals.add(Meal.fromJson(json));
      });
      return meals;
    } catch (e) {
      Logger().e(e);
      rethrow;
    }
  }

  Future<List<MealDetail>> getMealDetail(String mealId) async {
    try {
      Response response = await _dioClient.get(Endpoints.mealDetail, queryParameters: {
        'i': mealId,
      });
      List<MealDetail> details = [];
      response.data['meals']?.forEach((json) {
        details.add(MealDetail.fromJson(json));
      });
      return details;
    } catch (e) {
      Logger().e(e);
      rethrow;
    }
  }
}
