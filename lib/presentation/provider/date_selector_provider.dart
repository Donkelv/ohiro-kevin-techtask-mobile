import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tech_task/util/color_const.dart';

final dateSelectorProvider = StateProvider<DateTime?>((ref) {
  return DateTime.now();
});

Future<void> datePicker(
    {required BuildContext context, required WidgetRef ref}) async {
  final DateTime? picked = await showDatePicker(
    context: context,
    initialDate: ref.watch(dateSelectorProvider)!,
    firstDate: DateTime(2018, 01, 01),
    lastDate: DateTime(DateTime.now().year + 1, 01, 01),
    builder: (context, child) {
      return Theme(
        data: Theme.of(context).copyWith(
          colorScheme: ColorScheme.light(
            primary: primaryColor,
            onPrimary: primaryColor1,
            onSurface: primaryColor,
          ),
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              backgroundColor: whiteColor,
            ),
          ),
        ),
        child: child!,
      );
    },
  );
  if (picked != null && picked != ref.watch(dateSelectorProvider)) {
    ref.watch(dateSelectorProvider.notifier).state = picked;
  }
}
