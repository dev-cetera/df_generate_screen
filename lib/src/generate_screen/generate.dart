//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// Dart/Flutter (DF) Packages by DevCetra.com & contributors. Use of this
// source code is governed by an an MIT-style license that can be found in the
// LICENSE file located in this project's root directory.
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
  required String templatesPath,
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
  debugLogStart('Starting generator. Please wait...');

  final controllerTemplate = extractCodeFromMarkdown(
    await loadFileFromPathOrUrl(
      [templatesPath, 'controller.dart.md'].join('/'),
    ),
  );

  final screenTemplate = extractCodeFromMarkdown(
    await loadFileFromPathOrUrl([templatesPath, 'screen.dart.md'].join('/')),
  );

  final viewTemplate = extractCodeFromMarkdown(
    await loadFileFromPathOrUrl([templatesPath, 'view.dart.md'].join('/')),
  );

  final insight = Insight(
    screenClassName: screenName.toPascalCase(),
    bindingsFileName: '_bindings.g.dart',
    controllerFileName: '_controller.dart',
    screenFileName: '${screenName.toSnakeCase()}.dart',
    viewFileName: '_view.dart',
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
      viewTemplate,
    ],
    insightMappers,
  );

  // ---------------------------------------------------------------------------

  // Notify end.
  debugLogStop('Done!');
}
