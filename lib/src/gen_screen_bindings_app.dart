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

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

Future<void> genScreenBindingsApp(
  List<String> args, {
  List<String> defaultTemplates = const [
    'https://raw.githubusercontent.com/robmllze/df_generate_screen/main/templates/v1/_bindings.g.dart.md',
  ],
}) async {
  final parser = CliParser(
    title: 'DevCetra.com/df/tools',
    description:
        'A tool for generating screen bindings for classes annotated @GenerateScreenBindings.',
    example: 'gen-screen-bindings -i .',
    additional:
        'For contributions, error reports and information, visit: https://github.com/DevCetra.',
    params: [
      DefaultFlags.HELP.flag,
      DefaultOptions.INPUT_PATH.option.copyWith(
        defaultsTo: FileSystemUtility.i.currentDir,
      ),
      DefaultMultiOptions.TEMPLATES.multiOption.copyWith(
        defaultsTo: defaultTemplates,
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
  late final List<String> templates;
  late final String? dartSdk;
  try {
    inputPath = argResults.option(DefaultOptions.INPUT_PATH.name)!;
    templates = argResults.multiOption(DefaultMultiOptions.TEMPLATES.name);
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
    'Looking for Dart files..',
  );
  final filePathStream0 = PathExplorer(inputPath).exploreFiles();
  final filePathStream1 = filePathStream0.where((e) => _isAllowedFileName(e.path));
  List<FilePathExplorerFinding> findings;
  try {
    findings = await filePathStream1.toList();
  } catch (e) {
    spinner.stop();
    _print(
      printRed,
      'Failed to read file tree!',
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

  final templateData = <String, String>{};
  for (final template in templates) {
    _print(
      printWhite,
      'Reading template at: $template...',
    );
    final result = await MdTemplateUtility.i.readTemplateFromPathOrUrl(
      template,
    );

    if (result.isErr) {
      spinner.stop();
      _print(
        printRed,
        ' Failed to read template!',
      );
      exit(ExitCodes.FAILURE.code);
    }
    templateData[template] = result.unwrap();
  }

  _print(
    printWhite,
    'Generating...',
    spinner,
  );

  for (final entry in templateData.entries) {
    final fileName = p.basename(entry.key).replaceAll('.md', '');
    final template = entry.value;
    try {
      for (final finding in findings) {
        final inputFilePath = finding.path;
        final insights = await extractInsightsFromFile(
          inputFilePath,
          analysisContextCollection,
        );
        for (final insight in insights) {
          final output = _interpolator.interpolate(template, insight);
          final outputFilePath = p.join(
            PathUtility.i.localDirName(inputFilePath),
            fileName,
          );
          await FileSystemUtility.i.writeLocalFile(outputFilePath, output);
          printWhite(
            '[gen-screen-bindings] ✔ Generated $fileName',
          );
        }
      }
    } catch (e) {
      _print(
        printRed,
        '✘ One or more files failed to generate!',
        spinner,
      );
      exit(ExitCodes.FAILURE.code);
    }
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
  print('[gen-screen-bindings] $message');
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

String _screenKey(ClassInsight<ModelGenerateScreenBindings> insight) {
  final a = insight.annotation.screenKey?.nullIfEmpty;
  final b = insight.className.replaceFirst('Screen', '').toSnakeCase();
  return a ?? b;
}

String _screenSegment(ClassInsight<ModelGenerateScreenBindings> insight) {
  final screenKey = _screenKey(insight);
  final path = insight.annotation.path ?? '';
  final screenSegment = p.joinAll(
    [
      path.isNotEmpty && path.startsWith(RegExp(r'[\\/]')) ? path.substring(1) : path,
      screenKey,
    ],
  );
  return screenSegment;
}

final _interpolator = TemplateInterpolator<ClassInsight<GenerateScreenBindings>>(
  {
    '___SCREEN_KEY___': _screenKey,
    '___SCREEN_SEGMENT___': _screenSegment,
    '___WIDGET_NAME___': (insight) {
      return insight.className;
    },
    '___DEFAULT_TITLE___': (insight) {
      return insight.annotation.title ??
          insight.className
              .toCamelCase()
              .replaceAll('screen', '')
              .split('_')
              .map((e) => e.capitalize())
              .join(' ');
    },
    '___SCREEN_CONST_KEY___': (insight) {
      final screenKey = _screenKey(insight);
      return screenKey.toUpperCase();
    },
    '___SCREEN_PATH___': (insight) {
      final screenSegment = _screenSegment(insight);
      return '/$screenSegment';
    },
    '___IS_ACCESSIBLE_ONLY_IF_LOGGED_IN_AND_VERIFIED___': (insight) {
      return (insight.annotation.isAccessibleOnlyIfLoggedInAndVerified ?? false).toString();
    },
    '___IS_ACCESSIBLE_ONLY_IF_LOGGED_IN___': (insight) {
      return (insight.annotation.isAccessibleOnlyIfLoggedIn ?? false).toString();
    },
    '___IS_ACCESSIBLE_ONLY_IF_LOGGED_OUT___': (insight) {
      return (insight.annotation.isAccessibleOnlyIfLoggedOut ?? false).toString();
    },
    '___IS_ALWAYS_ACCESSIBLE___': (insight) {
      final a = insight.annotation.isAccessibleOnlyIfLoggedInAndVerified ?? false;
      final b = insight.annotation.isAccessibleOnlyIfLoggedIn ?? false;
      final c = insight.annotation.isAccessibleOnlyIfLoggedOut ?? false;
      if (a && b) {
        throw Exception(
          'Cannot set both `isAccessibleOnlyIfLoggedInAndVerified` and `isAccessibleOnlyIfLoggedIn` to `true`.',
        );
      }
      if (a && c) {
        throw Exception(
          'Cannot set both `isAccessibleOnlyIfLoggedInAndVerified` and `isAccessibleOnlyIfLoggedOut` to `true`.',
        );
      }
      if (b && c) {
        throw Exception(
          'Cannot set both `isAccessibleOnlyIfLoggedIn` and `isAccessibleOnlyIfLoggedOut` to `true`.',
        );
      }
      final isAlwaysAccessible = (!a && !b && !c);
      return isAlwaysAccessible.toString();
    },
    '___IS_REDIRECTABLE___': (insight) {
      final b = insight.annotation.isRedirectable ?? false;
      final params = insight.annotation.internalParameters;
      if (b && params != null && params.isNotEmpty) {
        for (final e in params) {
          final field = FieldUtils.ofOrNull(e)!;
          if (field.nullable == false) {
            throw Exception(
              'Cannot set `isRedirectable` to `true` if `internalParameters` contains required parameters.',
            );
          }
        }
      }
      return b.toString();
    },
    '___IP0___': (insight) {
      final params =
          insight.annotation.internalParameters?.map((e) => FieldUtils.ofOrNull(e)).nonNulls ?? {};
      if (params.isNotEmpty) {
        final a = params.map((e) {
          final fieldName = e.fieldPath!.join('_').toCamelCase();
          final fieldKey = insight.stringCaseType.convert(fieldName);
          final fieldType = e.fieldType;
          final nullable = e.nullable != false;
          final exclamationMark = nullable ? '' : '!';
          final questionMark = nullable ? '?' : '';
          final fieldK = 'K_${fieldName.toUpperSnakeCase()}';
          return [
            '/// Key corresponding to the value `$fieldName`',
            "static const $fieldK = '$fieldKey';",
            '/// Returns the **internal parameter** with the key `$fieldKey`',
            '/// or [$fieldK].',
            '$fieldType$questionMark get $fieldName => arg<$fieldType>($fieldK)$exclamationMark;',
          ].join('\n');
        }).toList()
          ..sort();
        return a.isNotEmpty ? a.join('\n') : '';
      } else {
        return '';
      }
    },
    '___IP1___': (insight) {
      final params =
          insight.annotation.internalParameters?.map((e) => FieldUtils.ofOrNull(e)).nonNulls ?? {};
      if (params.isNotEmpty) {
        final a = params.map((e) {
          final fieldName = e.fieldPath!.join('_').toCamelCase();
          final fieldType = e.fieldType;
          final nullable = e.nullable != false;
          final questionMark = nullable ? '?' : '';
          final required = nullable ? '' : 'required ';
          return '$required$fieldType$questionMark $fieldName,';
        }).toList()
          ..sort();
        return a.isNotEmpty ? a.join('\n') : '';
      } else {
        return '';
      }
    },
    '___IP2___': (insight) {
      final params =
          insight.annotation.internalParameters?.map((e) => FieldUtils.ofOrNull(e)).nonNulls ?? {};
      if (params.isNotEmpty) {
        final a = params.map((e) {
          final fieldName = e.fieldPath!.join('_').toCamelCase();
          final fieldK = 'K_${fieldName.toUpperSnakeCase()}';
          return '$fieldK: $fieldName,';
        }).toList()
          ..sort();
        return a.isNotEmpty ? a.join('\n') : '';
      } else {
        return '';
      }
    },
    '___QP0___': (insight) {
      final params =
          insight.annotation.queryParameters?.map((e) => FieldUtils.ofOrNull(e)).nonNulls ?? {};
      if (params.isNotEmpty) {
        final a = params.map((e) {
          final fieldName = e.fieldPath!.join('_').toCamelCase();
          final fieldKey = insight.stringCaseType.convert(fieldName);
          final nullable = e.nullable != false;
          final fieldK = 'K_${fieldName.toUpperSnakeCase()}';
          final exclamationMark = nullable ? '' : '!';
          final questionMark = nullable ? '?' : '';
          return [
            '/// Key corresponding to the value `$fieldName`',
            // ignore: unnecessary_string_escapes
            "static const $fieldK = '$fieldKey';",
            '/// Returns the URI **query parameter** with the key `$fieldKey`',
            '/// or [$fieldK].',
            'String$questionMark get $fieldName => arg<String>($fieldK)$exclamationMark;',
          ].join('\n');
        }).toList()
          ..sort();
        return a.isNotEmpty ? a.join('\n') : '';
      } else {
        return '';
      }
    },
    '___QP1___': (insight) {
      final params =
          insight.annotation.queryParameters?.map((e) => FieldUtils.ofOrNull(e)).nonNulls ?? {};
      if (params.isNotEmpty) {
        final a = params.map((e) {
          final fieldName = e.fieldPath!.join('_').toCamelCase();
          final nullable = e.nullable != false;
          return "${nullable ? "String?" : "required String"} $fieldName,";
        }).toList()
          ..sort();
        return a.isNotEmpty ? a.join('\n') : '';
      } else {
        return '';
      }
    },
    '___QP2___': (insight) {
      final params =
          insight.annotation.queryParameters?.map((e) => FieldUtils.ofOrNull(e)).nonNulls ?? {};
      if (params.isNotEmpty) {
        final a = params.map((e) {
          final fieldName = e.fieldPath!.join('_').toCamelCase();
          final nullable = e.nullable != false;
          final fieldK = 'K_${fieldName.toSnakeCase().toUpperCase()}';
          return "${nullable ? "if ($fieldName != null) " : ""}$fieldK: $fieldName,";
        }).toList()
          ..sort();
        return a.isNotEmpty ? a.join('\n') : '';
      } else {
        return '';
      }
    },
  },
);
