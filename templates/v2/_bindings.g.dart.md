```dart
//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// GENERATED - DO NOT MODIFY BY HAND
// See: https://github.com/dev-cetera/df_generate_screen
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

// ignore_for_file: unused_element
// ignore_for_file: constant_identifier_names,

part of 'widget.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class ___WIDGET_NAME___Extra {
  ___IP0_V2___

  const ___WIDGET_NAME___Extra({
    ___IP1___
    // ignore: unused_element_parameter
    @visibleForTesting
    Map<dynamic, dynamic>? $dummy,
  });
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

/// Extend this class to create a controller for the [___WIDGET_NAME___] screen.
abstract base class _ControllerBroker<T1 extends ___WIDGET_NAME___, T2 extends _State> extends ScreenController {

  /// The [Screen] that corresponds to `this` controller.
  late final screen = super.superScreen as T1;

  /// The [State] that corresponds to `this` controller.
  late final state = super.superState as T2;

  ___QP3_V2___

  _ControllerBroker(super.superScreen, super.superState);
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

/// A controller type corresponding to [___WIDGET_NAME___].
typedef T___WIDGET_NAME___Controller =  _ControllerBroker<___WIDGET_NAME___, _State>;

/// A [AdaptiveScreenState] type corresponding to [___WIDGET_NAME___].
typedef TAdaptive___WIDGET_NAME___State = AdaptiveScreenState<___WIDGET_NAME___, ___WIDGET_NAME___Controller>;

/// A [ScreenState] type corresponding to [___WIDGET_NAME___].
typedef T___WIDGET_NAME___State = ScreenState<___WIDGET_NAME___, ___WIDGET_NAME___Controller>;

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

final class ___WIDGET_NAME___RouteState extends RouteState<___WIDGET_NAME___Extra?> {
  ___QP0_V2___

  ___WIDGET_NAME___RouteState({
    ___QP1_V2___
    ___WIDGET_NAME___Extra? extra,
  }) : super.parse(
    _PATH,
    extra: extra,
    queryParameters: {
      ___QP2_V2___
    },
  );
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class ___WIDGET_NAME___RouteBuilder extends RouteBuilder<___WIDGET_NAME___Extra?> {
  ___WIDGET_NAME___RouteBuilder()
      : super(
          routeState: ___WIDGET_NAME___RouteState(),
          condition: ___CONDITION___,
          builder: (context, routeState) {
            return ___WIDGET_NAME___(routeState: routeState);
          },
        );
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

base class ____WIDGET_NAME___ extends Screen<___WIDGET_NAME___Extra?> {
  const ____WIDGET_NAME___({
    required super.key,
    required super.routeState,
    // ignore: unused_element_parameter
    super.controllerTimeout = Duration.zero,
  });

  @override
  createState() => _State();

  @override
  createController(
    Screen screen,
    ScreenState state,
  ) {
    return ___WIDGET_NAME___Controller(screen, state);
  }
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

const _CLASS = '___WIDGET_NAME___';
const _SEGMENT = '___SCREEN_SEGMENT___';
const _PATH = '/$_SEGMENT';
const _TR_KEY = 'screens.___WIDGET_NAME___';
const _DEFAULT_TITLE = '___DEFAULT_TITLE___';
```
