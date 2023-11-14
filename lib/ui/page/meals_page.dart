import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ns_meal/config/routes/pages.dart';
import 'package:ns_meal/controller/meals_controller.dart';
import 'package:ns_meal/ui/component/app_image.dart';
import 'package:ns_meal/ui/component/reload_button.dart';
import 'package:ns_meal/util/strings.dart';

class MealsPage extends StatelessWidget {
  const MealsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<MealsController>(
      builder: (controller) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: Text(controller.category?.strCategory ?? Pages.meals.toTitle),
            ),
            body: Column(
              children: [
                AppImage(
                  width: context.width,
                  height: context.height / 5,
                  url: controller.category!.strCategoryThumb,
                  tag: controller.category!.idCategory,
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
                                        Strings.failedToFetchMeals,
                                        style: Theme.of(context).textTheme.titleMedium,
                                      ),
                                      const SizedBox(height: 16),
                                      ReloadButton(onTap: controller.retry),
                                    ],
                                  ),
                                )
                              :

                              /// meals
                              ListView.builder(
                                  itemCount: controller.meals.length,
                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 24),
                                  itemBuilder: (BuildContext context, int index) {
                                    return ListTile(
                                      onTap: () =>
                                          controller.goToMealDetail(controller.meals[index]),
                                      contentPadding: const EdgeInsets.symmetric(vertical: 4),
                                      title: Text(
                                          controller.meals[index].strMeal ?? Strings.emptyString),
                                      leading: AppImage(
                                        tag: controller.meals[index].idMeal ?? Strings.emptyString,
                                        url: controller.meals[index].strMealThumb,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    );
                                  },
                                ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
