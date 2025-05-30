```dart
//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// GENERATED - DO NOT MODIFY BY HAND
// See: https://github.com/dev-cetera/df_generate_screen
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import 'package:df_screen/df_screen.dart';
import 'package:flutter/widgets.dart' show SizedBox;

import '_screens.g.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

final class EmptyScreenState extends RouteState {
  EmptyScreenState() : super.parse('/empty');
}

final class ErrorScreenState extends RouteState<Enum> {
  ErrorScreenState() : super.parse('/error');
}

final routeBuilders = [
    RouteBuilder(
    routeState: EmptyScreenState(),
    builder: (context, state) {
      return RouteWidgetBuilder(
        builder: (context, state) => const SizedBox.shrink(),
      );
    },
  ),
  RouteBuilder(
    routeState: ErrorScreenState(),
    builder: (context, state) {
      return RouteWidgetBuilder(
        builder: (context, state) => const SizedBox.shrink(),
      );
    },
  ),
  ___ROUTE_BUILDERS___
];
```
