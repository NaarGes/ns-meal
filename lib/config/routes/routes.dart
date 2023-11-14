import 'package:get/get.dart';
import 'package:ns_meal/config/routes/pages.dart';
import 'package:ns_meal/controller/home_controller.dart';
import 'package:ns_meal/controller/meal_detail_controller.dart';
import 'package:ns_meal/controller/meals_controller.dart';
import 'package:ns_meal/ui/page/meal_detail_page.dart';
import 'package:ns_meal/ui/page/meals_page.dart';
import 'package:ns_meal/ui/page/home_page.dart';
import 'package:ns_meal/ui/page/not_found_page.dart';

class Routes {
  static List<GetPage> pages = [
    GetPage(
        name: Pages.home.toPath,
        page: () => const HomePage(),
        binding: BindingsBuilder(() {
          Get.put(HomeController());
        }),
        transition: Transition.native,
        children: [
          GetPage(
              name: Pages.meals.toPath,
              page: () => const MealsPage(),
              binding: BindingsBuilder(() {
                Get.put(MealsController());
              }),
              transition: Transition.native,
              children: [
                GetPage(
                  name: Pages.mealDetails.toPath,
                  page: () => const MealDetailPage(),
                  binding: BindingsBuilder(() {
                    Get.put(MealDetailController());
                  }),
                  transition: Transition.native,
                ),
              ]),
        ]),
  ];

  static GetPage unknownRoute = GetPage(
    name: Pages.notFound.toPath,
    page: () => const NotFoundPage(),
  );
}
