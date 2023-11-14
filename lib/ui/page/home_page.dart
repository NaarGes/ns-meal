import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ns_meal/config/routes/pages.dart';
import 'package:ns_meal/config/theme/assets.dart';
import 'package:ns_meal/controller/home_controller.dart';
import 'package:ns_meal/ui/component/reload_button.dart';
import 'package:ns_meal/util/strings.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(Pages.home.toTitle),
        ),
        body: GetX<HomeController>(
          builder: (controller) {
            /// loading
            if (controller.loading.value) {
              // todo return shimmer
              return Center(
                child: CircularProgressIndicator(
                  color: Theme.of(context).colorScheme.primary,
                ),
              );
            }

            /// error
            if (controller.hasError.value) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      Strings.failedToFetchCategories,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 16),
                    ReloadButton(onTap: controller.retry),
                  ],
                ),
              );
            }

            /// categories
            return ListView.builder(
              itemCount: controller.categories.length,
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 24),
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  contentPadding: const EdgeInsets.symmetric(vertical: 4),
                  title: Text(controller.categories[index].strCategory ?? Strings.emptyString),
                  leading: CachedNetworkImage(
                    imageUrl: controller.categories[index].strCategoryThumb ?? Strings.emptyString,
                    placeholder: (context, url) => Image.asset(Assets.plate),
                    errorWidget: (context, url, error) => Image.asset(Assets.plate),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
