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

/// Serves as the blueprint for the [LoginScreen] screen.
/// It outlines the screen's properties and behaviors prior to routing.
class LoginScreenConfiguration extends ModelScreenConfiguration {
  //
  //
  //

  factory LoginScreenConfiguration({
    Map<dynamic, dynamic>? $args,
  }) {
    return LoginScreenConfiguration.optional(
      args: {
        ...?$args,
      }.nonNulls,
    );
  }

  //
  //
  //

  LoginScreenConfiguration.optional({
    Map<dynamic, dynamic>? args,
  }) : super.optional(
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
  static const IS_ACCESSIBLE_ONLY_IF_LOGGED_IN_AND_VERIFIED =
      _IS_ACCESSIBLE_ONLY_IF_LOGGED_IN_AND_VERIFIED;

  /// Whether the corresponding [Screen] is only accessible if the user is logged out.
  static const IS_ACCESSIBLE_ONLY_IF_LOGGED_OUT = _IS_ACCESSIBLE_ONLY_IF_LOGGED_OUT;

  /// Whether the corresponding [Screen] is redirectable, i.e., if it can be requested from the browser URL.
  static const IS_REDIRECTABLE = _IS_REDIRECTABLE;
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

/// Extend this class to create a controller for the [LoginScreen] screen.
abstract base class _ControllerBroker<T1 extends LoginScreen, T2 extends _State>
    extends ScreenController<LoginScreenConfiguration> {
  /// The [Screen] that corresponds to `this` controller.
  late final screen = super.superScreen as T1;

  /// The [State] that corresponds to `this` controller.
  late final state = super.superState as T2;

  /// The [ModelScreenConfiguration] that corresponds to `this` controller.
  late final configuration = screen.extra is LoginScreenConfiguration
      ? screen.extra as LoginScreenConfiguration
      : LoginScreenConfiguration.optional(
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

/// The generated [GoRoute] that corresponds to [LoginScreen].
final generatedLoginScreenRoute = GoRoute(
  path: _SEGMENT,
  pageBuilder: (context, state) {
    final extra = letAsOrNull<ModelScreenConfiguration>(state.extra);
    return NoTransitionPage(
      key: state.pageKey,
      child: LoginScreen(
        key: _globalKey,
        extra: extra ??
            urlToScreenConfiguration(
              url: state.uri,
              isAccessibleOnlyIfLoggedIn: LoginScreenConfiguration.IS_ACCESSIBLE_ONLY_IF_LOGGED_IN,
              isAccessibleOnlyIfLoggedInAndVerified:
                  LoginScreenConfiguration.IS_ACCESSIBLE_ONLY_IF_LOGGED_IN_AND_VERIFIED,
              isAccessibleOnlyIfLoggedOut:
                  LoginScreenConfiguration.IS_ACCESSIBLE_ONLY_IF_LOGGED_OUT,
              isRedirectable: LoginScreenConfiguration.IS_REDIRECTABLE,
              title: null,
            ),
      ),
    );
  },
);

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

/// Returns a [LoginScreen] instance if the [configuration] is of type
/// [LoginScreenConfiguration] and if the current authentication status matches
/// [isLoggedInAndVerified], [isLoggedIn], and [isLoggedOut].
Screen? makerLoginScreen(
  ModelScreenConfiguration extra,
  bool isLoggedInAndVerified,
  bool isLoggedIn,
  bool isLoggedOut,
) {
  if ((_IS_ACCESSIBLE_ONLY_IF_LOGGED_IN_AND_VERIFIED && !isLoggedInAndVerified) ||
      (_IS_ACCESSIBLE_ONLY_IF_LOGGED_IN && !isLoggedIn) ||
      (_IS_ACCESSIBLE_ONLY_IF_LOGGED_OUT && !isLoggedOut)) {
    return null;
  }
  if (extra is LoginScreenConfiguration) {
    return LoginScreen(
      key: _globalKey,
      extra: extra,
    );
  }
  if (RegExp(r'^(' + _PATH + r')([?/].*)?$').hasMatch(Uri.decodeComponent(extra.path ?? ''))) {
    final temp = LoginScreenConfiguration.optional(
      args: extra.args,
    );
    return LoginScreen(
      key: _globalKey,
      extra: temp,
    );
  }
  return null;
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

/// A controller type corresponding to [LoginScreen].
typedef TLoginScreenController = _ControllerBroker<LoginScreen, _State>;

/// A [AdaptiveScreenState] type corresponding to [LoginScreen].
typedef TAdaptiveLoginScreenState
    = AdaptiveScreenState<LoginScreen, LoginScreenConfiguration, LoginScreenController>;

/// A [ScreenState] type corresponding to [LoginScreen].
typedef TLoginScreenState
    = ScreenState<LoginScreen, LoginScreenConfiguration, LoginScreenController>;

/// A [ScreenPageState] type corresponding to [LoginScreen].
typedef TLoginScreenPageState<T extends ScreenPage>
    = ScreenPageState<T, LoginScreenConfiguration, LoginScreenController>;

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

base class _LoginScreen extends Screen {
  const _LoginScreen({
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
    return LoginScreenController(screen, state);
  }
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

// The following constants are set by the generator based on the provided
// options. Together they form the behavior of the generated screen.

const _IS_ACCESSIBLE_ONLY_IF_LOGGED_IN_AND_VERIFIED = false;
const _IS_ACCESSIBLE_ONLY_IF_LOGGED_IN = false;
const _IS_ACCESSIBLE_ONLY_IF_LOGGED_OUT = false;
const _IS_REDIRECTABLE = true;
const _CLASS = 'LoginScreen';
const _SEGMENT = 'login';
const _PATH = '/$_SEGMENT';
const _TR_KEY = 'screens.LoginScreen';
const _DEFAULT_TITLE = 'LoginScreen';
