//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// Dart/Flutter (DF) Packages by dev-cetera.com & contributors. The use of this
// source code is governed by an MIT-style license described in the LICENSE
// file located in this project's root directory.
//
// See: https://opensource.org/license/mit
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:df_gen_core/df_gen_core.dart';
import 'package:df_gen_core/df_gen_core.dart' as df_gen_core;
import 'package:df_generate_dart_models_core/df_generate_dart_models_core.dart';
// ignore: implementation_imports
import 'package:df_config/src/_etc/replace_data.dart';

import 'package:path/path.dart' as p;

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

Future<void> generateScreen(
  List<String> args, {
  List<String> defaultTemplates = const [
    'https://raw.githubusercontent.com/dev-cetera/df_generate_screen/main/templates/v2/_state.dart.md',
    'https://raw.githubusercontent.com/dev-cetera/df_generate_screen/main/templates/v2/widget.dart.md',
    'https://raw.githubusercontent.com/dev-cetera/df_generate_screen/main/templates/v2/_controller.dart.md',
  ],
}) async {
  Log.enableReleaseAsserts = true;
  final parser = CliParser(
    title: 'dev-cetera.com',
    description:
        'A tool for generating screen/page files for Flutter projects.',
    example: 'df_generate_screen -i .',
    additional:
        'For contributions, error reports and information, visit: https://github.com/dev-cetera.',
    params: [
      DefaultFlags.HELP.flag,
      DefaultMultiOptions.TEMPLATES.multiOption.copyWith(
        defaultsTo: defaultTemplates,
      ),
      const df_gen_core.OptionParam(
        name: 'name',
        abbr: 'n',
        help: 'The name of the screen to generate.',
        defaultsTo: 'ExampleScreen',
      ),
      DefaultOptionParams.OUTPUT_PATH.option.copyWith(
        defaultsTo: FileSystemUtility.i.currentDir,
      ),
    ],
  );

  // ---------------------------------------------------------------------------

  final (argResults, argParser) = parser.parse(args);

  // ---------------------------------------------------------------------------

  final help = argResults.flag(DefaultFlags.HELP.name);
  if (help) {
    _print(Log.printCyan, parser.getInfo(argParser));
    exit(ExitCodes.SUCCESS.code);
  }

  // ---------------------------------------------------------------------------

  late final String name;
  late final List<String> templates;
  late final String outputPath;
  try {
    name = argResults.option('name')!;
    templates = argResults.multiOption(DefaultMultiOptions.TEMPLATES.name);
    outputPath = argResults.option(DefaultOptionParams.OUTPUT_PATH.name)!;
  } catch (_) {
    _print(
      Log.printRed,
      'Missing required args! Use --help flag for more information.',
    );
    exit(ExitCodes.FAILURE.code);
  }

  // ---------------------------------------------------------------------------

  final templateData = <String, String>{};
  for (final template in templates) {
    _print(Log.printWhite, 'Reading template at: $template...');
    final result = await MdTemplateUtility.i
        .readTemplateFromPathOrUrl(template)
        .value;

    if (result.isErr()) {
      _print(Log.printRed, ' Failed to read template!');
      exit(ExitCodes.FAILURE.code);
    }
    templateData[template] = result.unwrap();
  }

  // ---------------------------------------------------------------------------

  _print(Log.printWhite, 'Generating...');

  for (final entry in templateData.entries) {
    final fileName = p.basename(entry.key).replaceAll('.md', '');
    final template = entry.value;
    // ignore: invalid_use_of_internal_member
    final data = template.replaceData({
      '___WIDGET_NAME___': name.toPascalCase(),
    });
    await FileSystemUtility.i.writeLocalFile(
      p.join(outputPath, name.toSnakeCase(), fileName),
      data,
    );
  }

  // ---------------------------------------------------------------------------
  _print(Log.printGreen, 'Done!');
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

void _print(void Function(String) print, String message) {
  print('[gen-screen] $message');
}
