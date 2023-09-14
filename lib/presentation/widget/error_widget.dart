import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tech_task/util/asset_const.dart';
import 'package:tech_task/util/theme.dart';

class CustomErrorWidget extends StatelessWidget {
  final String text;
  const CustomErrorWidget({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(errorGif),
        20.0.verticalSpace,
        Text(
          text,
          textAlign: TextAlign.center,
          style: normalText(),
        )
      ],
    );
  }
}
