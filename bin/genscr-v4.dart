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

import 'dart:io' show Directory;

import 'package:df_generate_screen/df_generate_screen.dart';

import 'package:df_log/df_log.dart';
import 'package:df_string/df_string.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

const VERSION = 'v4';

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
