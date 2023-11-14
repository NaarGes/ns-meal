class Endpoints {
  Endpoints._();

  /// server
  static const String baseUrl = 'https://www.themealdb.com/api/json/v1/1';
  static const Duration receiveTimeout = Duration(milliseconds: 20000);
  static const Duration connectionTimeout = Duration(milliseconds: 20000);

  /// urls
  static const String categories = '/categories.php';
  static const String meals = '/filter.php';
  static const String mealDetail = '/lookup.php';
}