import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ns_meal/config/routes/pages.dart';
import 'package:ns_meal/controller/meal_detail_controller.dart';
import 'package:ns_meal/ui/component/app_image.dart';
import 'package:ns_meal/ui/component/reload_button.dart';
import 'package:ns_meal/util/strings.dart';

class MealDetailPage extends StatelessWidget {
  const MealDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetX<MealDetailController>(
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              title: Text(controller.meal?.strMeal ?? Pages.mealDetails.toTitle),
            ),
            body: Column(
              children: [
                AppImage(
                  width: context.width,
                  height: context.height / 3,
                  url: controller.meal!.strMealThumb,
                  tag: controller.meal!.idMeal,
                ),
                const SizedBox(height: 16),
                Expanded(
                  child:

                      /// loading
                      controller.loading.value
                          ?
                          // todo return shimmer
                          Center(
                              child: CircularProgressIndicator(
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            )
                          :

                          /// error
                          controller.hasError.value
                              ? Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        Strings.failedToFetchMealDetail,
                                        style: Theme.of(context).textTheme.titleMedium,
                                      ),
                                      const SizedBox(height: 16),
                                      ReloadButton(onTap: controller.retry),
                                    ],
                                  ),
                                )

                              /// details
                              : Text(controller.details[0].strMeal ?? Strings.emptyString),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
