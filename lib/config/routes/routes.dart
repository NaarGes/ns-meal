import 'package:get/get.dart';
import 'package:ns_meal/config/routes/pages.dart';
import 'package:ns_meal/controller/home_controller.dart';
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
    ),
  ];

  static GetPage unknownRoute = GetPage(
    name: Pages.notFound.toPath,
    page: () => const NotFoundPage(),
  );
}
