class MealDetail {
  String? idMeal;
  String? strMeal;
  String? strDrinkAlternate;
  String? strCategory;
  String? strArea;
  String? strInstructions;
  String? strMealThumb;
  String? strTags;
  String? strYoutube;
  List<String>? ingredients;
  List<String>? measures;
  String? strSource;
  String? strImageSource;
  String? strCreativeCommonsConfirmed;
  String? dateModified;

  MealDetail(
      {this.idMeal,
      this.strMeal,
      this.strDrinkAlternate,
      this.strCategory,
      this.strArea,
      this.strInstructions,
      this.strMealThumb,
      this.strTags,
      this.strYoutube,
      this.ingredients,
      this.measures,
      this.strSource,
      this.strImageSource,
      this.strCreativeCommonsConfirmed,
      this.dateModified});

  MealDetail.fromJson(Map<String, dynamic> json) {
    idMeal = json['idMeal'];
    strMeal = json['strMeal'];
    strDrinkAlternate = json['strDrinkAlternate'];
    strCategory = json['strCategory'];
    strArea = json['strArea'];
    strInstructions = json['strInstructions'];
    strMealThumb = json['strMealThumb'];
    strTags = json['strTags'];
    strYoutube = json['strYoutube'];
    ingredients = [];
    measures = [];
    if (json['strIngredient1'] != null) {
      ingredients!.add(json['strIngredient1']);
      measures!.add(json['strMeasure1']);
    }
    if (json['strIngredient2'] != null) {
      ingredients!.add(json['strIngredient2']);
      measures!.add(json['strMeasure2']);
    }
    if (json['strIngredient3'] != null) {
      ingredients!.add(json['strIngredient3']);
      measures!.add(json['strMeasure3']);
    }
    if (json['strIngredient4'] != null) {
      ingredients!.add(json['strIngredient4']);
      measures!.add(json['strMeasure4']);
    }
    if (json['strIngredient5'] != null) {
      ingredients!.add(json['strIngredient5']);
      measures!.add(json['strMeasure5']);
    }
    if (json['strIngredient6'] != null) {
      ingredients!.add(json['strIngredient6']);
      measures!.add(json['strMeasure6']);
    }
    if (json['strIngredient7'] != null) {
      ingredients!.add(json['strIngredient7']);
      measures!.add(json['strMeasure7']);
    }
    if (json['strIngredient8'] != null) {
      ingredients!.add(json['strIngredient8']);
      measures!.add(json['strMeasure8']);
    }
    if (json['strIngredient9'] != null) {
      ingredients!.add(json['strIngredient9']);
      measures!.add(json['strMeasure9']);
    }
    if (json['strIngredient10'] != null) {
      ingredients!.add(json['strIngredient10']);
      measures!.add(json['strMeasure10']);
    }
    if (json['strIngredient11'] != null) {
      ingredients!.add(json['strIngredient11']);
      measures!.add(json['strMeasure11']);
    }
    if (json['strIngredient12'] != null) {
      ingredients!.add(json['strIngredient12']);
      measures!.add(json['strMeasure12']);
    }
    if (json['strIngredient13'] != null) {
      ingredients!.add(json['strIngredient13']);
      measures!.add(json['strMeasure13']);
    }
    if (json['strIngredient14'] != null) {
      ingredients!.add(json['strIngredient14']);
      measures!.add(json['strMeasure14']);
    }
    if (json['strIngredient15'] != null) {
      ingredients!.add(json['strIngredient15']);
      measures!.add(json['strMeasure15']);
    }
    if (json['strIngredient16'] != null) {
      ingredients!.add(json['strIngredient16']);
      measures!.add(json['strMeasure16']);
    }
    if (json['strIngredient17'] != null) {
      ingredients!.add(json['strIngredient17']);
      measures!.add(json['strMeasure17']);
    }
    if (json['strIngredient18'] != null) {
      ingredients!.add(json['strIngredient18']);
      measures!.add(json['strMeasure18']);
    }
    if (json['strIngredient19'] != null) {
      ingredients!.add(json['strIngredient19']);
      measures!.add(json['strMeasure19']);
    }
    if (json['strIngredient20'] != null) {
      ingredients!.add(json['strIngredient20']);
      measures!.add(json['strMeasure20']);
    }
    strSource = json['strSource'];
    strImageSource = json['strImageSource'];
    strCreativeCommonsConfirmed = json['strCreativeCommonsConfirmed'];
    dateModified = json['dateModified'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['idMeal'] = idMeal;
    data['strMeal'] = strMeal;
    data['strDrinkAlternate'] = strDrinkAlternate;
    data['strCategory'] = strCategory;
    data['strArea'] = strArea;
    data['strInstructions'] = strInstructions;
    data['strMealThumb'] = strMealThumb;
    data['strTags'] = strTags;
    data['strYoutube'] = strYoutube;
    for (int i = 0; i < (ingredients?.length ?? 0); i++) {
      data['strIngredient${i + 1}'] = ingredients![i];
    }

    for (int i = 0; i < (measures?.length ?? 0); i++) {
      data['strMeasure${i + 1}'] = measures![i];
    }
    data['strSource'] = strSource;
    data['strImageSource'] = strImageSource;
    data['strCreativeCommonsConfirmed'] = strCreativeCommonsConfirmed;
    data['dateModified'] = dateModified;
    return data;
  }
}
