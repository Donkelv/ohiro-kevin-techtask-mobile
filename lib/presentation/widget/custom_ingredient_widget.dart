import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tech_task/domain/entites/ingredient.dart';
import 'package:tech_task/util/color_const.dart';
import 'package:tech_task/util/theme.dart';

class CustomIngredientWidget extends StatelessWidget {
  final int index;
  final IngredientEntity data;
  final bool usedBy;
  final void Function()? onTap;
  const CustomIngredientWidget({
    super.key,
    required this.index,
    required this.data,
    required this.usedBy,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 12.0.h),
      decoration: BoxDecoration(
        color: primaryColor1,
        borderRadius: BorderRadius.circular(10.0.r),
      ),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(10.0.r),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0.w, vertical: 10.0.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(5.0.r),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Icon(
                      PhosphorIcons.hamburger,
                      size: 32.0,
                    ),
                  ),
                ),
                20.0.horizontalSpace,
                Text(
                  data.title!,
                  style: normalText(),
                ),
                Spacer(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "Use By",
                      style: smallText(),
                    ),
                    5.0.verticalSpace,
                    Text(
                      data.useBy!,
                      style: normalText(),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
