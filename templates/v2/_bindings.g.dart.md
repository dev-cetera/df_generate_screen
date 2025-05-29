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

class ____WIDGET_NAME___Extra {
  //
  //
  //

  ___IP0_V2___

  //
  //
  //

  const ____WIDGET_NAME___Extra({
    ___IP1__
    @visibleForTesting
    Map<dynamic, dynamic>? $dummy,
  });

  //
  //
  //

  /// The name of the corresponding [Screen] class.
  static const WIDGET = _CLASS;

  /// The path of the corresponding [Screen].
  static const PATH = _PATH;

  /// The segment of the corresponding [Screen] path.
  static const SEGMENT = _SEGMENT;

  /// The translation key for the corresponding [Screen].
  static const TR_KEY = _TR_KEY;

  /// Whether the corresponding [Screen] is only accessible if the user is logged in and verified.
  static const IS_ACCESSIBLE_ONLY_IF_LOGGED_IN = _IS_ACCESSIBLE_ONLY_IF_LOGGED_IN;

  /// Whether the corresponding [Screen] is only accessible if the user is logged in.
  static const IS_ACCESSIBLE_ONLY_IF_LOGGED_IN_AND_VERIFIED = _IS_ACCESSIBLE_ONLY_IF_LOGGED_IN_AND_VERIFIED;

  /// Whether the corresponding [Screen] is only accessible if the user is logged out.
  static const IS_ACCESSIBLE_ONLY_IF_LOGGED_OUT = _IS_ACCESSIBLE_ONLY_IF_LOGGED_OUT;

  /// Whether the corresponding [Screen] is redirectable, i.e., if it can be requested from the browser URL.
  static const IS_REDIRECTABLE = _IS_REDIRECTABLE;
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

/// Extend this class to create a controller for the [___WIDGET_NAME___] screen.
abstract base class _ControllerBroker<T1 extends ___WIDGET_NAME___, T2 extends _State>
    extends ScreenController<___WIDGET_NAME___Configuration> {

  /// The [Screen] that corresponds to `this` controller.
  late final screen = super.superScreen as T1;

  /// The [State] that corresponds to `this` controller.
  late final state = super.superState as T2;

  ___QP3_V2___

  _ControllerBroker(
    super.superScreen,
    super.superState, [
    super.routeState,
  ]);
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

/// A controller type corresponding to [___WIDGET_NAME___].
typedef T___WIDGET_NAME___Controller =  _ControllerBroker<___WIDGET_NAME___, _State>;

/// A [AdaptiveScreenState] type corresponding to [___WIDGET_NAME___].
typedef TAdaptive___WIDGET_NAME___State = AdaptiveScreenState<___WIDGET_NAME___, ___WIDGET_NAME___Configuration, ___WIDGET_NAME___Controller>;

/// A [ScreenState] type corresponding to [___WIDGET_NAME___].
typedef T___WIDGET_NAME___State = ScreenState<___WIDGET_NAME___, ___WIDGET_NAME___Configuration, ___WIDGET_NAME___Controller>;

/// A [ScreenPageState] type corresponding to [___WIDGET_NAME___].
typedef T___WIDGET_NAME___PageState<T extends ScreenPage> = ScreenPageState<T, ___WIDGET_NAME___Configuration, ___WIDGET_NAME___Controller>;

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

final class ____WIDGET_NAME___RouteState extends RouteState<____WIDGET_NAME___Extra?> {
  //
  //
  //

  ___QP0_V2___

  //
  //
  //

  ____WIDGET_NAME___RouteState({
    ___QP1___
    Map<dynamic, dynamic>? $queryParameters,
  }) : super.parse(
    _PATH,
    queryParameters: {
      ___QP2_V2___
      ...?$queryParameters
    },
  );
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

base class ____WIDGET_NAME___ extends Screen {
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

// The following constants are set by the generator based on the provided
// options. Together they form the behavior of the generated screen.

const _IS_ACCESSIBLE_ONLY_IF_LOGGED_IN_AND_VERIFIED = ___IS_ACCESSIBLE_ONLY_IF_LOGGED_IN_AND_VERIFIED___;
const _IS_ACCESSIBLE_ONLY_IF_LOGGED_IN = ___IS_ACCESSIBLE_ONLY_IF_LOGGED_IN___;
const _IS_ACCESSIBLE_ONLY_IF_LOGGED_OUT = ___IS_ACCESSIBLE_ONLY_IF_LOGGED_OUT___;
const _IS_REDIRECTABLE = ___IS_REDIRECTABLE___;
const _CLASS = '___WIDGET_NAME___';
const _SEGMENT = '___SCREEN_SEGMENT___';
const _PATH = '/$_SEGMENT';
const _TR_KEY = 'screens.___WIDGET_NAME___';
const _DEFAULT_TITLE = '___DEFAULT_TITLE___';
```
