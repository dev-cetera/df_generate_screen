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

import 'package:df_gen_core/df_gen_core.dart';
import 'package:df_log/df_log.dart';
import 'package:df_string/df_string.dart';

import '_insight.dart';
import '_insight_mappers.dart';
import '_generator_converger.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

Future<void> generateScreen({
  String? fallbackDartSdkPath,
  required String outputDirPath,
  required String screenName,
  required String templatePathOrUrl,
  String? path,
  bool isAccessibleOnlyIfLoggedIn = false,
  bool isAccessibleOnlyIfLoggedInAndVerified = false,
  bool isAccessibleOnlyIfLoggedOut = false,
  bool isRedirectable = false,
  Map<String, String> internalParameters = const {},
  Set<String> queryParameters = const {},
  String? title,
  Set<String> partFileDirs = const {},
}) async {
  // Notify start.
  printBlue('Starting generator. Please wait...');

  final controllerTemplate = extractCodeFromMarkdown(
    (await FileSystemUtility.i.readFileFromPathOrUrl(
      [templatePathOrUrl, 'controller.dart.md'].join('/'),
    ))!,
  );

  final screenTemplate = extractCodeFromMarkdown(
    (await FileSystemUtility.i.readFileFromPathOrUrl(
      [templatePathOrUrl, 'screen.dart.md'].join('/'),
    ))!,
  );

  final stateTemplate = extractCodeFromMarkdown(
    (await FileSystemUtility.i.readFileFromPathOrUrl(
      [templatePathOrUrl, 'state.dart.md'].join('/'),
    ))!,
  );

  final insight = Insight(
    screenClassName: screenName.toPascalCase(),
    bindingsFileName: '_bindings.g.dart',
    controllerFileName: '_controller.dart',
    screenFileName: '${screenName.toSnakeCase()}.dart',
    stateFileName: '_state.dart',
    isAccessibleOnlyIfLoggedIn: isAccessibleOnlyIfLoggedIn,
    isAccessibleOnlyIfLoggedInAndVerified:
        isAccessibleOnlyIfLoggedInAndVerified,
    isAccessibleOnlyIfLoggedOut: isAccessibleOnlyIfLoggedOut,
    isRedirectable: isRedirectable,
    internalParameters: internalParameters,
    queryParameters: queryParameters,
    path: path,
    title: title,
    partFileDirs: partFileDirs,
  );

  // Converge what was gathered to generate the output.
  await generatorConverger.converge(
    [insight],
    [
      controllerTemplate,
      screenTemplate,
      stateTemplate,
    ],
    insightMappers,
  );

  // ---------------------------------------------------------------------------

  // Notify end.
  printPurple('Done!');
}
