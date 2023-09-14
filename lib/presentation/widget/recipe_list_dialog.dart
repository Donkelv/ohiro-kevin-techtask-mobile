




import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tech_task/presentation/provider/recipe_provider.dart';
import 'package:tech_task/util/asset_const.dart';
import 'package:tech_task/util/color_const.dart';
import 'package:tech_task/util/theme.dart';

class RecipeListDialog extends ConsumerWidget {
  const RecipeListDialog({
    super.key,
    //required this.ref,
    required this.ingredient,
  });

  //final WidgetRef ref;
  final String ingredient;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Dialog(
      backgroundColor: whiteColor,
      elevation: 2.0,
      //insetPadding: EdgeInsets.all(30.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0.r),
      ),
      child: AnimatedSize(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
        child: ref.watch(getRecipeListProvider).when(
          initial: () {
            return SizedBox(
              height: 300.0.h,
              child: Center(
                child: CircularProgressIndicator(
                  strokeWidth: 2.0,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    primaryColor,
                  ),
                ),
              ),
            );
          },
          loading: () {
            return SizedBox(
              height: 300.0.h,
              child: Center(
                child: CircularProgressIndicator(
                  strokeWidth: 2.0,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    primaryColor,
                  ),
                ),
              ),
            );
          },
          empty: () {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(errorGif),
                //5.0.verticalSpace,
                Text(
                  "Oops, $ingredient recipe list is empty\ncheck back later",
                  textAlign: TextAlign.center,
                  style: semiLargeTextInter(),
                ),
                20.0.verticalSpace,
              ],
            );
          },
          loaded: (loaded) {
            return Scrollbar(
              thumbVisibility: true,
              child: ListView.builder(
                  itemCount: loaded.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 25.0.w, vertical: 20.0.h),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            loaded[index].title!,
                            style: mediumTextInter(),
                          ),
                          15.0.verticalSpace,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: loaded[index]
                                .ingredients!
                                .map(
                                  (e) => Text(
                                    "• $e",
                                    style: normalText(),
                                  ),
                                )
                                .toList(),
                          )
                        ],
                      ),
                    );
                  }),
            );
          },
          error: (error) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(errorGif),
                //5.0.verticalSpace,
                Text(
                  error,
                  textAlign: TextAlign.center,
                  style: semiLargeTextInter(),
                ),
                20.0.verticalSpace,
              ],
            );
          },
        ),
      ),
    );
  }
}
