```dart
//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// GENERATED - DO NOT MODIFY BY HAND
// See: https://github.com/DevCetra/df_generate_screen
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

// ignore_for_file: unused_element

part of 'widget.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

final _globalKey = GlobalKey<_State>();

/// Serves as the blueprint for the [___WIDGET_NAME___] screen.
/// It outlines the screen's properties and behaviors prior to routing.
class ___WIDGET_NAME___Configuration extends ModelScreenConfiguration {
  //
  //
  //

  ___IP0___
  ___QP0___

  factory ___WIDGET_NAME___Configuration({
    ___IP1___
    ___QP1___
    Map<dynamic, dynamic>? $args,
  }) {
    return ___WIDGET_NAME___Configuration.optional(
      args: {
         ___IP2___
         ___QP2___
        ...?$args,
      }.nonNulls,
    );
  }

  //
  //
  //

  ___WIDGET_NAME___Configuration.optional({
    Map<dynamic, dynamic>? args,
  }): super.optional(
    title: null,
    path: _PATH,
    args: args ?? {},
    isAccessibleOnlyIfLoggedInAndVerified: _IS_ACCESSIBLE_ONLY_IF_LOGGED_IN_AND_VERIFIED,
    isAccessibleOnlyIfLoggedIn: _IS_ACCESSIBLE_ONLY_IF_LOGGED_IN,
    isAccessibleOnlyIfLoggedOut: _IS_ACCESSIBLE_ONLY_IF_LOGGED_OUT,
    isRedirectable: _IS_REDIRECTABLE,
  );

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

  /// The [ModelScreenConfiguration] that corresponds to `this` controller.
  late final configuration = screen.extra is ___WIDGET_NAME___Configuration
      ? screen.extra as ___WIDGET_NAME___Configuration
      : ___WIDGET_NAME___Configuration.optional(
          args: screen.extra is ModelScreenConfiguration
              ? (screen.extra as ModelScreenConfiguration).args
              : {},
        );

  _ControllerBroker(
    super.superScreen,
    super.superState, [
    super.extra,
  ]);
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

/// The generated [GoRoute] that corresponds to [___WIDGET_NAME___].
final generated___WIDGET_NAME___Route = GoRoute(
  path: _SEGMENT,
  pageBuilder: (context, state) {
    final extra = letAsOrNull<ModelScreenConfiguration>(state.extra);
    return NoTransitionPage(
      key: state.pageKey,
      child: ___WIDGET_NAME___(
        key: _globalKey,
        extra: extra ?? urlToScreenConfiguration(
          url: state.uri,
          isAccessibleOnlyIfLoggedIn: ___WIDGET_NAME___Configuration.IS_ACCESSIBLE_ONLY_IF_LOGGED_IN,
          isAccessibleOnlyIfLoggedInAndVerified: ___WIDGET_NAME___Configuration.IS_ACCESSIBLE_ONLY_IF_LOGGED_IN_AND_VERIFIED,
          isAccessibleOnlyIfLoggedOut: ___WIDGET_NAME___Configuration.IS_ACCESSIBLE_ONLY_IF_LOGGED_OUT,
          isRedirectable: ___WIDGET_NAME___Configuration.IS_REDIRECTABLE,
          title: null,
        ),
      ),
    );
  },
);

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

/// Returns a [___WIDGET_NAME___] instance if the [configuration] is of type
/// [___WIDGET_NAME___Configuration] and if the current authentication status matches
/// [isLoggedInAndVerified], [isLoggedIn], and [isLoggedOut].
Screen? maker___WIDGET_NAME___(
  ModelScreenConfiguration extra,
  bool isLoggedInAndVerified,
  bool isLoggedIn,
  bool isLoggedOut,
) {
  if ((_IS_ACCESSIBLE_ONLY_IF_LOGGED_IN_AND_VERIFIED && !isLoggedInAndVerified) || (_IS_ACCESSIBLE_ONLY_IF_LOGGED_IN && !isLoggedIn) || (_IS_ACCESSIBLE_ONLY_IF_LOGGED_OUT && !isLoggedOut)) {
    return null;
  }
  if (extra is ___WIDGET_NAME___Configuration) {
    return ___WIDGET_NAME___(
      key: _globalKey,
      extra: extra,
    );
  }
  if (RegExp(r'^(' + _PATH + r')([?/].*)?$')
      .hasMatch(Uri.decodeComponent(extra.path ?? ''))) {
    final temp = ___WIDGET_NAME___Configuration.optional(
      args: extra.args,
    );
    return ___WIDGET_NAME___(
      key: _globalKey,
      extra: temp,
    );
  }
  return null;
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

base class ____WIDGET_NAME___ extends Screen {
  const ____WIDGET_NAME___({
    required super.key,
    required super.extra,
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
