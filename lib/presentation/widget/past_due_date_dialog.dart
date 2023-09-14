



import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tech_task/util/asset_const.dart';
import 'package:tech_task/util/color_const.dart';
import 'package:tech_task/util/theme.dart';

class PastDueDateDialog extends StatelessWidget {
  const PastDueDateDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: whiteColor,
      elevation: 2.0,
      //insetPadding: EdgeInsets.all(30.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(errorGif),
          //5.0.verticalSpace,
          Text(
            "Oops, this ingredient is\npast its date of use",
            textAlign: TextAlign.center,
            style: semiLargeTextInter(),
          ),
          20.0.verticalSpace,
        ],
      ),
    );
  }
}
