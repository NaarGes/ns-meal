import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ns_meal/config/app_constants.dart';
import 'package:ns_meal/config/routes/routes.dart';
import 'package:ns_meal/config/theme/themes.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      useInheritedMediaQuery: true,
      title: AppConstants.appName,
      themeMode: ThemeMode.light,
      theme: Themes.lightThemeBuilder(context),
      darkTheme: Themes.darkThemeBuilder(context),
      getPages: Routes.pages,
      initialBinding: BindingsBuilder(() {}),
      unknownRoute: Routes.unknownRoute,
    );
  }
}
