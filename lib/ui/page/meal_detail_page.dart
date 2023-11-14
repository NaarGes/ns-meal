import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ns_meal/config/routes/pages.dart';
import 'package:ns_meal/config/theme/assets.dart';
import 'package:ns_meal/controller/meal_detail_controller.dart';
import 'package:ns_meal/ui/component/reload_button.dart';
import 'package:ns_meal/util/strings.dart';

class MealDetailPage extends StatelessWidget {
  const MealDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: GetX<MealDetailController>(
              builder: (controller) {
                return Text(controller.details.isNotEmpty ? controller.details[0].strMeal ??
                    Pages.mealDetails.toTitle : Pages.mealDetails.toTitle);
              }
          ),
        ),
        body: GetX<MealDetailController>(
          builder: (controller) {
            /// loading
            if (controller.loading.value) {
              // todo return shimmer
              return Center(
                child: CircularProgressIndicator(
                  color: Theme
                      .of(context)
                      .colorScheme
                      .primary,
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
                      Strings.failedToFetchMealDetail,
                      style: Theme
                          .of(context)
                          .textTheme
                          .titleMedium,
                    ),
                    const SizedBox(height: 16),
                    ReloadButton(onTap: controller.retry),
                  ],
                ),
              );
            }

            /// categories
            return Column(
              children: [
                // todo use hero tag
                CachedNetworkImage(
                  width: context.width,
                  height: context.height / 3,
                  fit: BoxFit.cover,
                  imageUrl: controller.details[0].strMealThumb ?? Strings.emptyString,
                  placeholder: (context, url) => Image.asset(Assets.plate),
                  errorWidget: (context, url, error) => Image.asset(Assets.plate),
                ),
                const SizedBox(height: 16),
                Text(controller.details[0].strMeal ?? Strings.emptyString)
              ],
            );
          },
        ),
      ),
    );
  }
}
