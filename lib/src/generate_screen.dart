//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// Dart/Flutter (DF) Packages by DevCetra.com & contributors. See LICENSE file
// in root directory.
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
  required String? controllerTemplateFilePath,
  required String? screenTemplateFilePath,
  required String? viewTemplateFilePath,
  required String? bindingsTemplateFilePath,
  String path = '',
  bool isAccessibleOnlyIfLoggedIn = false,
  bool isAccessibleOnlyIfLoggedInAndVerified = false,
  bool isAccessibleOnlyIfLoggedOut = false,
  bool isRedirectable = false,
  Map<String, String> internalParameters = const {},
  Set<String> queryParameters = const {},
  String makeup = '',
  String title = '',
  Set<String> partFileDirs = const {},
}) async {
  // Notify start.
  debugLogStart('Starting generator. Please wait...');

  final controllerTemplate = extractCodeFromMarkdown(
    await loadFileFromGitHub(
      username: 'robmllze',
      repo: 'df_generate_dart_models_core',
      filePath: [
        controllerTemplateFilePath ?? 'templates/controller.dart.md',
      ].join('/'),
    ),
  );

  final screenTemplate = extractCodeFromMarkdown(
    await loadFileFromGitHub(
      username: 'robmllze',
      repo: 'df_generate_dart_models_core',
      filePath: [
        screenTemplateFilePath ?? 'templates/screen.dart.md',
      ].join('/'),
    ),
  );

  final viewTemplate = extractCodeFromMarkdown(
    await loadFileFromGitHub(
      username: 'robmllze',
      repo: 'df_generate_dart_models_core',
      filePath: [
        viewTemplateFilePath ?? 'templates/view.dart.md',
      ].join('/'),
    ),
  );

  final bindingsTemplate = extractCodeFromMarkdown(
    await loadFileFromGitHub(
      username: 'robmllze',
      repo: 'df_generate_dart_models_core',
      filePath: [
        bindingsTemplateFilePath ?? 'templates/bindings.dart.md',
      ].join('/'),
    ),
  );

  final screenClassKey = screenName.toSnakeCase();

  final insight = Insight(
    screenClassName: screenName.toSnakeCase(),
    bindingsFileName: '_bindings.g.dart',
    controllerFileName: '_controller.dart',
    screenFileName: '$screenClassKey.dart',
    viewFileName: '_view.dart',
    isAccessibleOnlyIfLoggedIn: isAccessibleOnlyIfLoggedIn,
    isAccessibleOnlyIfLoggedInAndVerified: isAccessibleOnlyIfLoggedInAndVerified,
    isAccessibleOnlyIfLoggedOut: isAccessibleOnlyIfLoggedOut,
    isRedirectable: isRedirectable,
    internalParameters: internalParameters,
    queryParameters: queryParameters,
    path: path,
    makeup: makeup,
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
      bindingsTemplate,
    ],
    insightMappers,
  );

  // ---------------------------------------------------------------------------

  // Notify end.
  debugLogStop('Done!');
}
