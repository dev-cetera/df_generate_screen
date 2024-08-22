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
import '_insight.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

final insightMappers = [
  _InsightMapper(
    placeholder: Placeholders.DEFAULT_TITLE,
    mapInsights: (insight) async {
      return insight.title ?? 'Title';
    },
  ),
  _InsightMapper(
    placeholder: Placeholders.SCREEN_CLASS,
    mapInsights: (insight) async {
      return insight.screenClassName;
    },
  ),
  _InsightMapper(
    placeholder: Placeholders.BINDINGS_FILE,
    mapInsights: (insight) async {
      return insight.bindingsFileName;
    },
  ),
  _InsightMapper(
    placeholder: Placeholders.CONTROLLER_FILE,
    mapInsights: (insight) async {
      return insight.controllerFileName;
    },
  ),
  _InsightMapper(
    placeholder: Placeholders.SCREEN_FILE,
    mapInsights: (insight) async {
      return insight.screenFileName;
    },
  ),
  _InsightMapper(
    placeholder: Placeholders.VIEW_FILE,
    mapInsights: (insight) async {
      return insight.viewFileName;
    },
  ),
  _InsightMapper(
    placeholder: Placeholders.Q1,
    mapInsights: (insight) async {
      final i1 = insight.internalParameters.entries
          .map(
            (e) => 'late final ${e.key} = this.configuration.${e.key};',
          )
          .join('\n');
      return i1;
    },
  ),
  _InsightMapper(
    placeholder: Placeholders.I1,
    mapInsights: (insight) async {
      final q1 =
          insight.queryParameters.map((e) => 'late final $e = this.configuration.$e;').join('\n');
      return q1;
    },
  ),
  _InsightMapper(
    placeholder: Placeholders.GENERATE_SCREEN_BINDINGS_ARGS,
    mapInsights: (insight) async {
      final a = insight.internalParameters.entries
          .map((e) {
            final k = e.key;
            final v = e.value;
            return k.isNotEmpty && v.isNotEmpty
                ? "(fieldName: '$k', fieldType: $v, nullable: ${k.endsWith('?')},)"
                : null;
          })
          .nonNulls
          .join(',');
      final b = insight.queryParameters
          .map((e) => e.isNotEmpty ? "(fieldName: '$e',)" : null)
          .nonNulls
          .join(',');
      final generateScreenBindingsArgs = [
        if (insight.path != null) "path: '${insight.path}'",
        if (insight.title != null) "title: '${insight.title}'",
        if (insight.isAccessibleOnlyIfLoggedIn) 'isAccessibleOnlyIfLoggedIn: true',
        if (insight.isAccessibleOnlyIfLoggedInAndVerified)
          'isAccessibleOnlyIfLoggedInAndVerified: true',
        if (insight.isAccessibleOnlyIfLoggedOut) 'isAccessibleOnlyIfLoggedOut: true',
        if (insight.isRedirectable) 'isRedirectable: true',
        if (insight.internalParameters.isNotEmpty && a.isNotEmpty) 'internalParameters: {$a,}',
        if (insight.queryParameters.isNotEmpty && b.isNotEmpty) 'queryParameters: {$b,}',
      ].join(',');
      return generateScreenBindingsArgs;
    },
  ),
  _InsightMapper(
    placeholder: Placeholders.PARTS,
    mapInsights: (insight) async {
      return insight.partFileDirs.isNotEmpty
          ? '// @GenerateDirectives\n${insight.partFileDirs.map((e) => e.toLowerCase().endsWith('.dart') ? e : '$e.dart').map((e) => "part '$e';'").join('\n')}'
          : '';
    },
  ),
];

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

enum Placeholders {
  DEFAULT_TITLE,
  SCREEN_CLASS,
  BINDINGS_FILE,
  CONTROLLER_FILE,
  SCREEN_FILE,
  VIEW_FILE,
  Q1,
  I1,
  GENERATE_SCREEN_BINDINGS_ARGS,
  PARTS,
}

typedef _InsightMapper = InsightMapper<Insight, Placeholders>;
