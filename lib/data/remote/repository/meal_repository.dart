import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:ns_meal/data/remote/core/dio_client.dart';
import 'package:ns_meal/data/remote/core/endpoints.dart';
import 'package:ns_meal/data/remote/model/category.model.dart';

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
}
