```dart
//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// GENERATED - DO NOT MODIFY BY HAND
// See: https://github.com/dev-cetera/df_generate_screen
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import '/_common.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

bool isLoggedInAndEmailVerified() {
  return DI.global
      .getSyncOrNone<AuthServiceInterface>()
      .map((e) => e.loggedInAndEmailVerified)
      .unwrapOr(false);
}

bool isLoggedIn() {
  return DI.global
      .getSyncOrNone<AuthServiceInterface>()
      .map((e) => e.loggedIn)
      .unwrapOr(false);
}

bool isLoggedOut() {
  return DI.global
      .getSyncOrNone<AuthServiceInterface>()
      .map((e) => e.loggedOut)
      .unwrapOr(false);
}

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
  ___ROUTE_BUILDERS___,
];
```
