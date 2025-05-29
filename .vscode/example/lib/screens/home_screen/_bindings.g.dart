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

final _globalKey = GlobalKey<_State>();

/// Serves as the blueprint for the [HomeScreen] screen.
/// It outlines the screen's properties and behaviors prior to routing.
class HomeScreenConfiguration extends ModelScreenConfiguration {
  //
  //
  //

  factory HomeScreenConfiguration({Map<dynamic, dynamic>? $args}) {
    return HomeScreenConfiguration.optional(args: {...?$args}.nonNulls);
  }

  //
  //
  //

  HomeScreenConfiguration.optional({Map<dynamic, dynamic>? args})
    : super.optional(
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

/// Extend this class to create a controller for the [HomeScreen] screen.
abstract base class _ControllerBroker<T1 extends HomeScreen, T2 extends _State>
    extends ScreenController<HomeScreenConfiguration> {
  /// The [Screen] that corresponds to `this` controller.
  late final screen = super.superScreen as T1;

  /// The [State] that corresponds to `this` controller.
  late final state = super.superState as T2;

  /// The [ModelScreenConfiguration] that corresponds to `this` controller.
  late final configuration =
      screen.extra is HomeScreenConfiguration
          ? screen.extra as HomeScreenConfiguration
          : HomeScreenConfiguration.optional(
            args:
                screen.extra is ModelScreenConfiguration
                    ? (screen.extra as ModelScreenConfiguration).args
                    : {},
          );

  _ControllerBroker(super.superScreen, super.superState, [super.extra]);
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

/// The generated [GoRoute] that corresponds to [HomeScreen].
final generatedHomeScreenRoute = GoRoute(
  path: _SEGMENT,
  pageBuilder: (context, state) {
    final extra = letAsOrNull<ModelScreenConfiguration>(state.extra);
    return NoTransitionPage(
      key: state.pageKey,
      child: HomeScreen(
        key: _globalKey,
        extra:
            extra ??
            urlToScreenConfiguration(
              url: state.uri,
              isAccessibleOnlyIfLoggedIn:
                  HomeScreenConfiguration.IS_ACCESSIBLE_ONLY_IF_LOGGED_IN,
              isAccessibleOnlyIfLoggedInAndVerified:
                  HomeScreenConfiguration
                      .IS_ACCESSIBLE_ONLY_IF_LOGGED_IN_AND_VERIFIED,
              isAccessibleOnlyIfLoggedOut:
                  HomeScreenConfiguration.IS_ACCESSIBLE_ONLY_IF_LOGGED_OUT,
              isRedirectable: HomeScreenConfiguration.IS_REDIRECTABLE,
              title: null,
            ),
      ),
    );
  },
);

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

/// Returns a [HomeScreen] instance if the [configuration] is of type
/// [HomeScreenConfiguration] and if the current authentication status matches
/// [isLoggedInAndVerified], [isLoggedIn], and [isLoggedOut].
Screen? makerHomeScreen(
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
  if (extra is HomeScreenConfiguration) {
    return HomeScreen(key: _globalKey, extra: extra);
  }
  if (RegExp(
    r'^(' + _PATH + r')([?/].*)?$',
  ).hasMatch(Uri.decodeComponent(extra.path ?? ''))) {
    final temp = HomeScreenConfiguration.optional(args: extra.args);
    return HomeScreen(key: _globalKey, extra: temp);
  }
  return null;
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

/// A controller type corresponding to [HomeScreen].
typedef THomeScreenController = _ControllerBroker<HomeScreen, _State>;

/// A [AdaptiveScreenState] type corresponding to [HomeScreen].
typedef TAdaptiveHomeScreenState =
    AdaptiveScreenState<
      HomeScreen,
      HomeScreenConfiguration,
      HomeScreenController
    >;

/// A [ScreenState] type corresponding to [HomeScreen].
typedef THomeScreenState =
    ScreenState<HomeScreen, HomeScreenConfiguration, HomeScreenController>;

/// A [ScreenPageState] type corresponding to [HomeScreen].
typedef THomeScreenPageState<T extends ScreenPage> =
    ScreenPageState<T, HomeScreenConfiguration, HomeScreenController>;

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

base class _HomeScreen extends Screen {
  const _HomeScreen({
    required super.key,
    required super.extra,
    // ignore: unused_element_parameter
    super.controllerTimeout = Duration.zero,
  });

  @override
  createState() => _State();

  @override
  createController(Screen screen, ScreenState state) {
    return HomeScreenController(screen, state);
  }
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

// The following constants are set by the generator based on the provided
// options. Together they form the behavior of the generated screen.

const _IS_ACCESSIBLE_ONLY_IF_LOGGED_IN_AND_VERIFIED = false;
const _IS_ACCESSIBLE_ONLY_IF_LOGGED_IN = false;
const _IS_ACCESSIBLE_ONLY_IF_LOGGED_OUT = false;
const _IS_REDIRECTABLE = true;
const _CLASS = 'HomeScreen';
const _SEGMENT = 'home';
const _PATH = '/$_SEGMENT';
const _TR_KEY = 'screens.HomeScreen';
const _DEFAULT_TITLE = 'HomeScreen';
