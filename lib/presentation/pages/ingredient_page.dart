import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tech_task/data/repositories/use_by_date_logic.dart';

import 'package:tech_task/presentation/provider/date_selector_provider.dart';
import 'package:tech_task/presentation/provider/recipe_provider.dart';
import 'package:tech_task/presentation/widget/custom_ingredient_widget.dart';
import 'package:tech_task/presentation/widget/error_widget.dart';
import 'package:tech_task/presentation/widget/past_due_date_dialog.dart';
import 'package:tech_task/presentation/widget/recipe_list_dialog.dart';
import 'package:tech_task/util/asset_const.dart';
import 'package:tech_task/util/color_const.dart';
import 'package:tech_task/util/theme.dart';

class IngredientPage extends ConsumerStatefulWidget {
  const IngredientPage({Key? key}) : super(key: key);

  @override
  ConsumerState<IngredientPage> createState() => _IngredientPageState();
}

class _IngredientPageState extends ConsumerState<IngredientPage> {
  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      ref.watch(getIngredientListProvider.notifier).getIngredientList();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        // For Android.
        // Use [light] for white status bar and [dark] for black status bar.
        statusBarIconBrightness: Brightness.dark,
        // For iOS.
        // Use [dark] for white status bar and [light] for black status bar.
        statusBarBrightness: Brightness.light,
        statusBarColor: Colors.transparent,
      ),
      child: Scaffold(
        backgroundColor: whiteColor,
        body: SafeArea(
          top: true,
          child: SizedBox(
            height: size.height,
            width: size.width,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 22.0.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  20.0.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Ingredients in your\nfridge",
                        style: semiLargeTextInter().copyWith(
                          color: blackColor,
                        ),
                      ),
                      SizedBox(
                        height: 70.0.h,
                        width: 70.0.w,
                        child: Image.asset(foodGif),
                      ),
                    ],
                  ),
                  5.0.verticalSpace,
                  TextButton.icon(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          side: BorderSide(
                            color: primaryColor,
                          ),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                    ),
                    onPressed: () {
                      datePicker(context: context, ref: ref);
                    },
                    icon: Icon(
                      PhosphorIcons.calendar,
                      color: primaryColor,
                    ),
                    label: Text(
                      "${ref.watch(dateSelectorProvider)!.year} - ${ref.watch(dateSelectorProvider)!.month} - ${ref.watch(dateSelectorProvider)!.day}",
                      style: normalText().copyWith(color: primaryColor),
                    ),
                  ),
                  5.0.verticalSpace,
                  Expanded(
                    child: Center(
                      child: ref.watch(getIngredientListProvider).when(
                        initial: () {
                          return CircularProgressIndicator(
                            strokeWidth: 2.0,
                            valueColor: AlwaysStoppedAnimation<Color>(
                              primaryColor,
                            ),
                          );
                        },
                        loading: () {
                          return CircularProgressIndicator(
                            strokeWidth: 2.0,
                            valueColor: AlwaysStoppedAnimation<Color>(
                              primaryColor,
                            ),
                          );
                        },
                        empty: () {
                          return CustomErrorWidget(
                            text: "Ingredient List Empty",
                          );
                        },
                        loaded: (loaded) {
                          return ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemCount: loaded.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return CustomIngredientWidget(
                                index: index,
                                data: loaded[index],
                                usedBy: isPastUseByDate(loaded[index].useBy!,
                                    ref.watch(dateSelectorProvider)!),
                                onTap: () {
                                  if (isPastUseByDate(loaded[index].useBy!,
                                          ref.watch(dateSelectorProvider)!) ==
                                      true) {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return PastDueDateDialog();
                                      },
                                    );
                                  } else {
                                    ref
                                        .watch(getRecipeListProvider.notifier)
                                        .getRecipeList(
                                            ingredient: loaded[index].title!);
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return RecipeListDialog(
                                            ingredient: loaded[index].title!);
                                      },
                                    );
                                  }
                                },
                              );
                            },
                          );
                        },
                        error: (error) {
                          return CustomErrorWidget(
                            text: error,
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}







