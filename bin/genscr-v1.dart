//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// Dart/Flutter (DF) Packages by DevCetra.com & contributors. SSee LICENSE file
// in root directory.
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import 'dart:io' show Directory;

import 'package:df_generate_screen/df_generate_screen.dart';

import 'package:df_log/df_log.dart';
import 'package:df_string/df_string.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

const VERSION = 'v1';

void main(List<String> args) async {
  final currentDir = Directory.current.path;
  DebugLog.debugOnly = false;

  final argsChecker = await runGenerateScreensApp([
    ...args,
    '--templates',
    'https://raw.githubusercontent.com/robmllze/df_generate_screen/main/templates/$VERSION/',
  ]);
  final folder = argsChecker.screenName?.toSnakeCase() ?? '.';
  await runGenerateScreenBindingsApp([
    '-r',
    currentDir,
    '-s',
    folder,
    '--template',
    'https://raw.githubusercontent.com/robmllze/df_generate_screen/main/templates/$VERSION/bindings.dart.md',
  ]);
  await generateScreenAccessApp([
    '-r',
    currentDir,
    '-s',
    '.',
    '--template',
    'https://raw.githubusercontent.com/robmllze/df_generate_screen/main/templates/$VERSION/access.dart.md',
  ]);
  await runGenerateIndexFilesForDartApp([
    '-r',
    currentDir,
    '-s',
    '.',
  ]);
}
