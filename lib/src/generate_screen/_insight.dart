//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// Dart/Flutter (DF) Packages by DevCetra.com & contributors. The use of this
// source code is governed by an MIT-style license described in the LICENSE
// file located in this project's root directory.
//
// See: https://opensource.org/license/mit
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

class Insight {
  final String screenClassName;
  final String bindingsFileName;
  final String controllerFileName;
  final String screenFileName;
  final String stateFileName;
  final bool isAccessibleOnlyIfLoggedIn;
  final bool isAccessibleOnlyIfLoggedInAndVerified;
  final bool isAccessibleOnlyIfLoggedOut;
  final bool isRedirectable;
  final Map<String, String> internalParameters;
  final Set<String> queryParameters;
  final String? path;
  final String? title;
  final Set<String> partFileDirs;

  const Insight({
    required this.screenClassName,
    required this.bindingsFileName,
    required this.controllerFileName,
    required this.screenFileName,
    required this.stateFileName,
    required this.isAccessibleOnlyIfLoggedIn,
    required this.isAccessibleOnlyIfLoggedInAndVerified,
    required this.isAccessibleOnlyIfLoggedOut,
    required this.isRedirectable,
    required this.internalParameters,
    required this.queryParameters,
    required this.path,
    required this.title,
    required this.partFileDirs,
  });
}
