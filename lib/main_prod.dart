

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tech_task/domain/routes/auth_selector.dart';
import 'package:tech_task/environment.dart';
import 'package:tech_task/util/api_const.dart';

void main() {
  FlavorConfig(
    flavor: Flavor.production,
    values: FlavorValues(baseUrl: baseUrl),
  );

  runApp(
    ProviderScope(
      child: AuthSelector(),
    ),
  );
}
