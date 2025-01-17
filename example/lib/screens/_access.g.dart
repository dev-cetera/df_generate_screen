//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// GENERATED - DO NOT MODIFY BY HAND
// See: https://github.com/dev-cetera/df_generate_screen
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

// ignore_for_file: constant_identifier_names

// ignore: depend_on_referenced_packages
import 'package:df_screen/df_screen.dart';

// This file should export all your screen widgets. If it doesn’t exist,
// generate it using the command “gen-indexes-dart -i .”, available via
// this package: https://pub.dev/packages/df_generate_dart_indexes
import '_index.g.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

/// A list of all screen routes in the app.
final generatedScreenRoutes = [
  generatedLoginScreenRoute,
  generatedHomeScreenRoute,
];

/// A list of function references. Each function returns a corresponding [Screen]
/// for a given [ModelScreenConfiguration] or `null` if the given configuration
/// does not match or access is denied to the screen.
const SCREEN_MAKERS = [
  makerLoginScreen,
  makerHomeScreen,
];

/// Finds the screen that corresponds to [configuration]. It iterates through
/// the list of screen makers and calls each one with the provided [configuration]
/// and authentication states ([isLoggedInAndVerified], [isLoggedIn], [isLoggedOut]).
/// If a screen is found that matches the configuration and is accessible, it is
/// returned. Otherwise, `null` is returned.
Screen? findScreenFromConfiguration({
  required ModelScreenConfiguration configuration,
  required bool? isLoggedInAndVerified,
  required bool? isLoggedIn,
  required bool? isLoggedOut,
}) {
  for (final screenMaker in SCREEN_MAKERS) {
    final screen = screenMaker.call(
      configuration,
      isLoggedInAndVerified ?? false,
      isLoggedIn ?? false,
      isLoggedOut ?? true,
    );
    if (screen != null) {
      return screen;
    }
  }
  return null;
}

/// Finds the screen that corresponds to [configuration], considering
/// the user's authentication state ([loggedIn], [verified]). It determines
/// whether the user is logged in, verified, or logged out, and then calls
/// `findScreenFromConfiguration` with these states. If a matching screen is
/// found and accessible, it is returned; otherwise, `null` is returned.
Screen? findScreenFromConfigurationAndAuthService({
  required ModelScreenConfiguration configuration,
  required bool loggedIn,
  required bool verified,
}) {
  final loggedOut = !loggedIn;
  final loggedInAndVerified = loggedIn && verified;
  return findScreenFromConfiguration(
    configuration: configuration,
    isLoggedInAndVerified: loggedInAndVerified,
    isLoggedIn: loggedIn,
    isLoggedOut: loggedOut,
  );
}

/// Translates the current URL into a [ModelScreenConfiguration], considering
/// the user's authentication state ([loggedIn], [verified]). It calls
/// `findScreenFromConfigurationAndAuthService` with the current URL's query
/// parameters and path, along with the user's authentication states. If a
/// matching screen configuration is found and accessible, it is returned;
/// otherwise, `null` is returned.
ModelScreenConfiguration? currentUrlToConfiguration({
  required bool loggedIn,
  required bool verified,
}) {
  return letAsOrNull<ModelScreenConfiguration>(
    findScreenFromConfigurationAndAuthService(
      configuration: ModelScreenConfiguration(
        args: Uri.base.queryParameters,
        path: Uri.base.path,
      ),
      loggedIn: loggedIn,
      verified: verified,
    )?.extra,
  );
}

/// Translates the current URL into a [ModelScreenConfiguration] under the
/// assumption that the user is logged in and verified. It calls
/// `findScreenFromConfiguration` with the current URL's query parameters and
/// path, assuming the user is logged in and verified. If a corresponding
/// screen is accessible, its configuration is returned; otherwise, `null` is
/// returned.
ModelScreenConfiguration? currentUrlToLoginConfiguration() {
  return letAsOrNull<ModelScreenConfiguration>(
    findScreenFromConfiguration(
      configuration: ModelScreenConfiguration(
        args: Uri.base.queryParameters,
        path: Uri.base.path,
      ),
      isLoggedInAndVerified: true,
      isLoggedIn: true,
      isLoggedOut: false,
    )?.extra,
  );
}

/// Translates the current URL into a [ModelScreenConfiguration] under the
/// assumption that the user is logged out. It calls `findScreenFromConfiguration`
/// with the current URL's query parameters and path, assuming the user is
/// logged out. If a corresponding screen is accessible, its configuration is
/// returned; otherwise, `null` is returned.
ModelScreenConfiguration? currentUrlToLogoutConfiguration() {
  return letAsOrNull<ModelScreenConfiguration>(
    findScreenFromConfiguration(
      configuration: ModelScreenConfiguration(
        args: Uri.base.queryParameters,
        path: Uri.base.path,
      ),
      isLoggedInAndVerified: false,
      isLoggedIn: false,
      isLoggedOut: true,
    )?.extra,
  );
}
