//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// 🇽🇾🇿 & Dev
//
// Licencing details are in the LICENSE file in the root directory.
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import 'package:args/args.dart';
import 'package:df_gen_core/df_gen_core.dart';

import 'generate.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

/// A command line app for generating screen access.
Future<void> generateScreenAccessApp(List<String> args) async {
  await runCommandLineApp(
    title: 'Generate Screen Access by DevCetra.com',
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
        'roots',
        abbr: 'r',
        help: 'Root directory paths separated by `&`.',
        defaultsTo: '.',
      )
      ..addOption(
        'subs',
        abbr: 's',
        help: 'Sub-directory paths separated by `&`.',
      )
      ..addOption(
        'patterns',
        abbr: 'p',
        help: 'Path patterns separated by `&`.',
      )
      ..addOption(
        'template',
        abbr: 't',
        help: 'Template file path or URL.',
        defaultsTo:
            'https://raw.githubusercontent.com/robmllze/df_generate_screen/main/templates/msm1/access.dart.md',
      )
      ..addOption(
        'output',
        abbr: 'o',
        help: 'Output file path.',
        defaultsTo: './_screen_access.g.dart',
      )
      ..addOption(
        'dart-sdk',
        help: 'Dart SDK path.',
      ),
    onResults: (parser, results) {
      return _ArgsChecker(
        fallbackDartSdkPath: results['dart-sdk'],
        templateFilePath: results['template'],
        rootPaths: splitArg(results['roots'])?.toSet(),
        subPaths: splitArg(results['subs'])?.toSet(),
        pathPatterns: splitArg(results['patterns'])?.toSet(),
        outputFilePath: results['output'],
      );
    },
    action: (parser, results, args) async {
      final outputFilePath = args.outputFilePath!;
      await generateScreenAccess(
        rootDirPaths: args.rootPaths ?? const {},
        subDirPaths: args.subPaths ?? const {},
        pathPatterns: args.pathPatterns ?? {},
        templateFilePath: args.templateFilePath!,
        outputFilePath: outputFilePath,
      );
      await fmtDartFile(outputFilePath);
    },
  );
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class _ArgsChecker extends ValidArgsChecker {
  //
  //
  //

  final Set<String>? rootPaths;
  final Set<String>? subPaths;
  final Set<String>? pathPatterns;
  final String? templateFilePath;
  final String? outputFilePath;
  final String? fallbackDartSdkPath;

  //
  //
  //

  const _ArgsChecker({
    required this.rootPaths,
    required this.subPaths,
    required this.pathPatterns,
    required this.templateFilePath,
    required this.outputFilePath,
    required this.fallbackDartSdkPath,
  });

  //
  //
  //

  @override
  List<dynamic> get args {
    final paths = [
      if (rootPaths != null) rootPaths,
      if (subPaths != null) subPaths,
    ];
    return [
      paths,
      ...paths,
      if (pathPatterns != null) pathPatterns,
      if (templateFilePath != null) templateFilePath,
      if (outputFilePath != null) outputFilePath,
      if (fallbackDartSdkPath != null) fallbackDartSdkPath,
    ];
  }
}
