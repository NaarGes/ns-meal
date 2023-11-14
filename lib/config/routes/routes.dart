import 'package:get/get.dart';
import 'package:ns_meal/config/routes/pages.dart';
import 'package:ns_meal/ui/pages/home_page.dart';
import 'package:ns_meal/ui/pages/not_found_page.dart';

class Routes {
  static List<GetPage> pages = [
    GetPage(
      name: Pages.home.toPath,
      page: () => const HomePage(),
      middlewares: const [],
    ),
  ];

  static GetPage unknownRoute = GetPage(
    name: Pages.notFound.toPath,
    page: () => const NotFoundPage(),
  );
}
