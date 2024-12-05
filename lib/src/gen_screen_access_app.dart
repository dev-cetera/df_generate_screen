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
import 'package:df_generate_dart_models_core/df_generate_dart_models_core.dart';
import 'package:df_screen_core/df_screen_core.dart';

import 'package:path/path.dart' as p;

import 'extract_insights_from_file.dart';

const _OUTPUT_FILE_NAME = '_access.g.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

Future<void> genScreenAccessApp(
  List<String> args, {
  String defaultTemplatePathOrUrl =
      'https://raw.githubusercontent.com/robmllze/df_generate_screen/main/templates/v1/access.dart.md',
}) async {
  final parser = CliParser(
    title: 'DevCetra.com/df/tools',
    description:
        'A tool for generating screen a access file for all classes annotated @GenerateScreenBindings withing a directory.',
    example: 'gen-screen-access -i .',
    additional:
        'For contributions, error reports and information, visit: https://github.com/DevCetra.',
    params: [
      DefaultFlags.HELP.flag,
      DefaultOptions.INPUT_PATH.option.copyWith(
        defaultsTo: FileSystemUtility.i.currentDir,
      ),
      DefaultOptions.TEMPLATE_PATH_OR_URL.option.copyWith(
        defaultsTo: defaultTemplatePathOrUrl,
      ),
      DefaultOptions.DART_SDK.option,
    ],
  );
  final (argResults, argParser) = parser.parse(args);
  final help = argResults.flag(DefaultFlags.HELP.name);
  if (help) {
    _print(
      printCyan,
      parser.getInfo(argParser),
    );
    exit(ExitCodes.SUCCESS.code);
  }
  late final String inputPath;
  late final String templatePathOrUrl;
  late final String? dartSdk;
  try {
    inputPath = argResults.option(DefaultOptions.INPUT_PATH.name)!;
    templatePathOrUrl = argResults.option(DefaultOptions.TEMPLATE_PATH_OR_URL.name)!;
    dartSdk = argResults.option(DefaultOptions.DART_SDK.name);
  } catch (_) {
    _print(
      printRed,
      'Missing required args! Use --help flag for more information.',
    );
    exit(ExitCodes.FAILURE.code);
  }
  final analysisContextCollection = createDartAnalysisContextCollection(
    {inputPath},
    dartSdk,
  );

  final spinner = Spinner();
  spinner.start();

  _print(
    printWhite,
    'Reading template at: $templatePathOrUrl...',
  );
  final result = await MdTemplateUtility.i.readTemplateFromPathOrUrl(
    templatePathOrUrl,
  );
  final template = result.unwrap();
  if (result.isErr) {
    _print(
      printRed,
      ' Failed to read template!',
      spinner,
    );
    exit(ExitCodes.FAILURE.code);
  }

  _print(
    printWhite,
    'Looking for Dart files..',
  );
  final filePathStream0 = PathExplorer(inputPath).exploreFiles();
  final filePathStream1 = filePathStream0.where((e) => _isAllowedFileName(e.path));
  List<FilePathExplorerFinding> findings;
  try {
    findings = await filePathStream1.toList();
  } catch (e) {
    _print(
      printRed,
      'Failed to read file tree!',
      spinner,
    );
    exit(ExitCodes.FAILURE.code);
  }
  if (findings.isEmpty) {
    spinner.stop();
    _print(
      printYellow,
      'No files found in $inputPath!',
    );
    exit(ExitCodes.SUCCESS.code);
  }

  _print(
    printWhite,
    'Generating access file...',
    spinner,
  );
  try {
    for (final finding in findings) {
      final inputFilePath = finding.path;
      final insights = await extractInsightsFromFile(
        inputFilePath,
        analysisContextCollection,
      );

      final output = _interpolator.interpolate(template, insights, ',');

      final outputFilePath = p.join(
        PathUtility.i.localDirName(inputFilePath),
        _OUTPUT_FILE_NAME,
      );
      await FileSystemUtility.i.writeLocalFile(outputFilePath, output);
      printWhite(
        '[gen-screen-access] ✔ Generated $_OUTPUT_FILE_NAME',
      );
    }
  } catch (e) {
    _print(
      printRed,
      '✘ One or more files failed to generate!',
      spinner,
    );
    exit(ExitCodes.FAILURE.code);
  }
  _print(
    printWhite,
    'Fixing generated files..',
    spinner,
  );
  await fixDartFile(inputPath);
  _print(
    printWhite,
    'Formatting generated files..',
    spinner,
  );
  spinner.start();
  await fmtDartFile(inputPath);
  spinner.stop();
  _print(
    printGreen,
    'Done!',
  );
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

void _print(
  void Function(String) print,
  String message, [
  Spinner? spinner,
]) {
  spinner?.stop();
  print('[gen-screen-access] $message');
  spinner?.start();
}

bool _isAllowedFileName(String e) {
  return !e.endsWith('.g.dart') && e.endsWith('.dart');
}

extension _ClassInsightExtension on ClassInsight<GenerateScreenBindings> {
  StringCaseType get stringCaseType {
    return StringCaseType.values.valueOf(annotation.keyStringCase) ?? StringCaseType.CAMEL_CASE;
  }
}

class TemplateInterpolator2<T> {
  final Map<String, String Function(T insight)> map;

  TemplateInterpolator2(this.map);

  String interpolate(
    String template,
    List<T> insights, [
    String separator = '\n',
  ]) {
    return template.replaceData(
      map.map(
        (k, v) => MapEntry(k, insights.map((e) => v(e)).join(separator)),
      ),
    );
  }
}

final _interpolator = TemplateInterpolator2<ClassInsight<GenerateScreenBindings>>(
  {
    '___SCREEN_MAKERS___': (insight) {
      final a = insight.className.toPascalCase();
      return 'maker$a';
    },
    '___PATHS___': (insight) {
      final a = insight.className.toUpperSnakeCase();
      return '...PATH_$a';
    },
    '___PATHS_NOT_REDIRECTABLE___': (insight) {
      final a = insight.className.toUpperSnakeCase();
      return '...PATH_NOT_REDIRECTABLE_$a';
    },
    '___PATHS_ALWAYS_ACCESSIBLE___': (insight) {
      final a = insight.className.toUpperSnakeCase();
      return '...PATH_ALWAYS_ACCESSIBLE_$a';
    },
    '___PATHS_ACCESSIBLE_ONLY_IF_LOGGED_IN_AND_VERIFIED___': (insight) {
      final a = insight.className.toUpperSnakeCase();
      return '...PATH_ACCESSIBLE_ONLY_IF_LOGGED_IN_AND_VERIFIED_$a';
    },
    '___PATHS_ACCESSIBLE_ONLY_IF_LOGGED_IN___': (insight) {
      final a = insight.className.toUpperSnakeCase();
      return '...PATH_ACCESSIBLE_ONLY_IF_LOGGED_IN_$a';
    },
    '___PATHS_ACCESSIBLE_ONLY_IF_LOGGED_OUT___': (insight) {
      final a = insight.className.toUpperSnakeCase();
      return '...PATH_ACCESSIBLE_ONLY_IF_LOGGED_OUT_$a';
    },
    '___GENERATED_SCREEN_ROUTES___': (insight) {
      final a = insight.className.toPascalCase();
      return 'generated${a}Route';
    },
  },
);
