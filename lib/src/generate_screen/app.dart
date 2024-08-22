//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// Dart/Flutter (DF) Packages by DevCetra.com & contributors. Use of this
// source code is governed by an an MIT-style license that can be found in the
// LICENSE file located in this project's root directory.
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import 'package:args/args.dart';
import 'package:df_gen_core/df_gen_core.dart';

import '../../df_generate_screen.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

/// A tool to generate ready-made screen templates for your Flutter app (uses df_sceen)
Future<_ArgsChecker> runGenerateScreensApp(List<String> args) async {
  late _ArgsChecker argsChecker;
  await runCommandLineApp(
    title: 'Generate Screens by DevCetra.com',
    description: '...',
    args: args,
    parser: ArgParser()
      ..addFlag(
        'help',
        abbr: 'h',
        negatable: false,
        help: 'Help information.',
      )
      ..addOption(
        'output',
        abbr: 'o',
        help: 'Output directory path.',
        defaultsTo: '.',
      )
      ..addOption(
        'class-name',
        abbr: 'n',
        help: 'Screen name.',
        defaultsTo: 'ScreenExample',
      )
      ..addOption(
        'internal-parameters',
        help: 'Internal parameters.',
      )
      ..addOption(
        'query-parameters',
        help: 'Query parameters.',
      )
      ..addOption(
        'templates',
        help: 'Template dir path or URL.',
        defaultsTo:
            'https://raw.githubusercontent.com/robmllze/df_generate_screen/main/templates/msm1/',
      )
      ..addOption(
        'path',
        help: 'Screen path.',
      )
      ..addOption(
        'is-only-accessible-if-logged-in',
        help: 'Is screen accessible if logged in?',
        defaultsTo: false.toString(),
      )
      ..addOption(
        'is-only-accessible-if-logged-in-and-verified',
        help: 'Is screen accessible if logged in and verified?',
        defaultsTo: false.toString(),
      )
      ..addOption(
        'is-only-accessible-if-logged-out',
        help: 'Is screen accessible if logged out?',
        defaultsTo: false.toString(),
      )
      ..addOption(
        'is-redirectable',
        help: 'Is screen redirectable?',
        defaultsTo: false.toString(),
      )
      ..addOption('default-title', help: 'Screen title.', defaultsTo: 'Title')
      ..addOption(
        'part-file-dirs',
        help: 'Part file directories separated by `&`.',
      )
      ..addOption(
        'dart-sdk',
        help: 'Dart SDK path.',
      ),
    onResults: (parser, results) {
      Map<String, String>? toOptionsMap(String option) {
        final entries = splitArg(results['internal-parameters'], '&&')
            ?.map((e) {
              final a = e.split(':');
              return a.length == 2 ? MapEntry(a[0], a[1]) : null;
            })
            .nonNulls
            .toSet();
        return entries != null
            ? Map<String, String>.fromEntries(entries)
            : null;
      }

      bool toBool(String option) {
        return results[option]?.toString().toLowerCase().trim() ==
            true.toString();
      }

      return argsChecker = _ArgsChecker(
        fallbackDartSdkPath: results['dart-sdk'],
        outputDirPath: results['output'],
        screenName: results['class-name'],
        templatesPath: results['templates'],
        path: results['path'],
        isAccessibleOnlyIfLoggedIn: toBool('is-only-accessible-if-logged-in'),
        isAccessibleOnlyIfLoggedInAndVerified:
            toBool('is-only-accessible-if-logged-in-and-verified'),
        isAccessibleOnlyIfLoggedOut: toBool('is-only-accessible-if-logged-out'),
        isRedirectable: toBool('is-redirectable'),
        internalParameters: toOptionsMap('internal-parameters'),
        queryParameters: splitArg(results['query-parameters'])?.toSet(),
        title: results['default-title'],
        partFileDirs: splitArg(results['part-file-dirs'])?.toSet(),
      );
    },
    action: (parser, results, args) async {
      await generateScreen(
        fallbackDartSdkPath: args.fallbackDartSdkPath,
        outputDirPath: args.outputDirPath!,
        screenName: args.screenName!,
        templatesPath: args.templatesPath!,
        path: args.path!,
        isAccessibleOnlyIfLoggedIn: args.isAccessibleOnlyIfLoggedIn ?? false,
        isAccessibleOnlyIfLoggedInAndVerified:
            args.isAccessibleOnlyIfLoggedInAndVerified ?? false,
        isAccessibleOnlyIfLoggedOut: args.isAccessibleOnlyIfLoggedOut ?? false,
        isRedirectable: args.isRedirectable ?? false,
        internalParameters: args.internalParameters ?? const {},
        queryParameters: args.queryParameters ?? const {},
        title: args.title ?? '',
        partFileDirs: args.partFileDirs ?? {},
      );
    },
  );
  return argsChecker;
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class _ArgsChecker extends ValidArgsChecker {
  //
  //
  //

  final String? fallbackDartSdkPath;
  final String? outputDirPath;
  final String? screenName;
  final String? templatesPath;
  final String? path;
  final bool? isAccessibleOnlyIfLoggedIn;
  final bool? isAccessibleOnlyIfLoggedInAndVerified;
  final bool? isAccessibleOnlyIfLoggedOut;
  final bool? isRedirectable;
  final Map<String, String>? internalParameters;
  final Set<String>? queryParameters;
  final String? title;
  final Set<String>? partFileDirs;

  //
  //
  //

  const _ArgsChecker({
    required this.fallbackDartSdkPath,
    required this.outputDirPath,
    required this.screenName,
    required this.templatesPath,
    required this.path,
    required this.isAccessibleOnlyIfLoggedIn,
    required this.isAccessibleOnlyIfLoggedInAndVerified,
    required this.isAccessibleOnlyIfLoggedOut,
    required this.isRedirectable,
    required this.internalParameters,
    required this.queryParameters,
    required this.title,
    required this.partFileDirs,
  });

  //
  //
  //

  @override
  List<dynamic> get args => [
        if (fallbackDartSdkPath != null) fallbackDartSdkPath,
        outputDirPath,
        screenName,
        if (templatesPath != null) templatesPath,
        if (isAccessibleOnlyIfLoggedInAndVerified != null)
          isAccessibleOnlyIfLoggedInAndVerified,
        if (isAccessibleOnlyIfLoggedIn != null) isAccessibleOnlyIfLoggedIn,
        if (isAccessibleOnlyIfLoggedOut != null) isAccessibleOnlyIfLoggedOut,
        if (isRedirectable != null) isRedirectable,
        if (title != null) title,
        if (partFileDirs != null) partFileDirs,
      ];
}
