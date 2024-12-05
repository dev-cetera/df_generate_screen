//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// GENERATED - DO NOT MODIFY BY HAND
// See: https://github.com/DevCetra/df_generate_screen
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

// ignore_for_file: unused_element
// ignore_for_file: constant_identifier_names,

part of 'widget.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

final _globalKey = GlobalKey<_State>();

/// Serves as the blueprint for the [ExampleScreen] screen.
/// It outlines the screen's properties and behaviors prior to routing.
class ExampleScreenConfiguration extends ModelScreenConfiguration {
  //
  //
  //

  factory ExampleScreenConfiguration({
    Map<dynamic, dynamic>? $args,
  }) {
    return ExampleScreenConfiguration.optional(
      args: {
        ...?$args,
      }.nonNulls,
    );
  }

  //
  //
  //

  ExampleScreenConfiguration.optional({
    Map<dynamic, dynamic>? args,
  }) : super.optional(
          title: null,
          path: _PATH,
          args: args ?? {},
          isAccessibleOnlyIfLoggedInAndVerified:
              _IS_ACCESSIBLE_ONLY_IF_LOGGED_IN_AND_VERIFIED,
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
  static const IS_ACCESSIBLE_ONLY_IF_LOGGED_IN =
      _IS_ACCESSIBLE_ONLY_IF_LOGGED_IN;

  /// Whether the corresponding [Screen] is only accessible if the user is logged in.
  static const IS_ACCESSIBLE_ONLY_IF_LOGGED_IN_AND_VERIFIED =
      _IS_ACCESSIBLE_ONLY_IF_LOGGED_IN_AND_VERIFIED;

  /// Whether the corresponding [Screen] is only accessible if the user is logged out.
  static const IS_ACCESSIBLE_ONLY_IF_LOGGED_OUT =
      _IS_ACCESSIBLE_ONLY_IF_LOGGED_OUT;

  /// Whether the corresponding [Screen] is redirectable, i.e., if it can be requested from the browser URL.
  static const IS_REDIRECTABLE = _IS_REDIRECTABLE;
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

/// Extend this class to create a controller for the [ExampleScreen] screen.
abstract base class _ControllerBroker<T1 extends ExampleScreen,
    T2 extends _State> extends ScreenController<ExampleScreenConfiguration> {
  /// The [Screen] that corresponds to `this` controller.
  late final screen = super.superScreen as T1;

  /// The [State] that corresponds to `this` controller.
  late final state = super.superState as T2;

  /// The [ModelScreenConfiguration] that corresponds to `this` controller.
  late final configuration = screen.extra is ExampleScreenConfiguration
      ? screen.extra as ExampleScreenConfiguration
      : ExampleScreenConfiguration.optional(
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

/// The generated [GoRoute] that corresponds to [ExampleScreen].
final generatedExampleScreenRoute = GoRoute(
  path: _SEGMENT,
  pageBuilder: (context, state) {
    final extra = letAsOrNull<ModelScreenConfiguration>(state.extra);
    return NoTransitionPage(
      key: state.pageKey,
      child: ExampleScreen(
        key: _globalKey,
        extra: extra ??
            urlToScreenConfiguration(
              url: state.uri,
              isAccessibleOnlyIfLoggedIn:
                  ExampleScreenConfiguration.IS_ACCESSIBLE_ONLY_IF_LOGGED_IN,
              isAccessibleOnlyIfLoggedInAndVerified: ExampleScreenConfiguration
                  .IS_ACCESSIBLE_ONLY_IF_LOGGED_IN_AND_VERIFIED,
              isAccessibleOnlyIfLoggedOut:
                  ExampleScreenConfiguration.IS_ACCESSIBLE_ONLY_IF_LOGGED_OUT,
              isRedirectable: ExampleScreenConfiguration.IS_REDIRECTABLE,
              title: null,
            ),
      ),
    );
  },
);

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

/// Returns a [ExampleScreen] instance if the [configuration] is of type
/// [ExampleScreenConfiguration] and if the current authentication status matches
/// [isLoggedInAndVerified], [isLoggedIn], and [isLoggedOut].
Screen? makerExampleScreen(
  ModelScreenConfiguration extra,
  bool isLoggedInAndVerified,
  bool isLoggedIn,
  bool isLoggedOut,
) {
  if ((_IS_ACCESSIBLE_ONLY_IF_LOGGED_IN_AND_VERIFIED &&
          !isLoggedInAndVerified) ||
      (_IS_ACCESSIBLE_ONLY_IF_LOGGED_IN && !isLoggedIn) ||
      (_IS_ACCESSIBLE_ONLY_IF_LOGGED_OUT && !isLoggedOut)) {
    return null;
  }
  if (extra is ExampleScreenConfiguration) {
    return ExampleScreen(
      key: _globalKey,
      extra: extra,
    );
  }
  if (RegExp(r'^(' + _PATH + r')([?/].*)?$')
      .hasMatch(Uri.decodeComponent(extra.path ?? ''))) {
    final temp = ExampleScreenConfiguration.optional(
      args: extra.args,
    );
    return ExampleScreen(
      key: _globalKey,
      extra: temp,
    );
  }
  return null;
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

/// A controller type corresponding to [ExampleScreen].
typedef TExampleScreenController = _ControllerBroker<ExampleScreen, _State>;

/// A [AdaptiveScreenState] type corresponding to [ExampleScreen].
typedef TAdaptiveExampleScreenState = AdaptiveScreenState<ExampleScreen,
    ExampleScreenConfiguration, ExampleScreenController>;

/// A [ScreenState] type corresponding to [ExampleScreen].
typedef TExampleScreenState = ScreenState<ExampleScreen,
    ExampleScreenConfiguration, ExampleScreenController>;

/// A [ScreenPageState] type corresponding to [ExampleScreen].
typedef TExampleScreenPageState<T extends ScreenPage>
    = ScreenPageState<T, ExampleScreenConfiguration, ExampleScreenController>;

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

base class _ExampleScreen extends Screen {
  const _ExampleScreen({
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
    return ExampleScreenController(screen, state);
  }
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

// The following constants are set by the generator based on the provided
// options. Together they form the behavior of the generated screen.

const _IS_ACCESSIBLE_ONLY_IF_LOGGED_IN_AND_VERIFIED = false;
const _IS_ACCESSIBLE_ONLY_IF_LOGGED_IN = false;
const _IS_ACCESSIBLE_ONLY_IF_LOGGED_OUT = false;
const _IS_REDIRECTABLE = false;
const _CLASS = 'ExampleScreen';
const _SEGMENT = 'example';
const _PATH = '/$_SEGMENT';
const _TR_KEY = 'screens.ExampleScreen';
const _DEFAULT_TITLE = 'ExampleScreen';
