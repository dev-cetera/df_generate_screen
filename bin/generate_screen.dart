//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// Dart/Flutter (DF) Packages by DevCetra.com & contributors. SSee LICENSE file
// in root directory.
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import 'dart:io' show Directory;

import 'package:df_generate_dart_indexes/df_generate_dart_indexes.dart';
import 'package:df_generate_screen/df_generate_screen.dart';
import 'package:df_log/df_log.dart';
import 'package:df_string/df_string.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

void main(List<String> args) async {
  final currentDir = Directory.current.path;
  DebugLog.debugOnly = false;
  final argsChecker = await runGenerateScreensApp(args);
  final r = argsChecker.screenName?.toSnakeCase() ?? '.';
  await runGenerateScreenBindingsApp(['-r', r]);
  await generateScreenAccessApp([]);
  DebugLog.debugOnly = false;
  await runGenerateIndexFilesForDartApp([
    '-r',
    currentDir,
    '-s',
    '.',
  ]);
}
