```dart
// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:df_screen/df_screen.dart';

part '_bindings.g.dart';
part '_controller.dart';
part '_view.dart';

___PARTS___

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

@GenerateScreenBindings(
  ___GENERATE_SCREEN_BINDINGS_ARGS___
)
final class ___SCREEN_CLASS___ extends Screen with _ScreenMixin {
  const ___SCREEN_CLASS___({
    super.key,
    super.configuration,
    super.controllerCacheTimeout = Duration.zero,
  });
}
```
