//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// Dart/Flutter (DF) Packages by DevCetra.com & contributors. See LICENSE file
// in root directory.
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import 'package:df_gen_core/df_gen_core.dart';
import 'package:df_screen_core/df_screen_core.dart';
import 'package:df_string/df_string.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

final insightMappers = [
  _InsightMapper(
    placeholder: Placeholders.SCREEN_MAKERS,
    mapInsights: (insight) async {
      final a = insight.className.toPascalCase();
      return 'maker$a';
    },
  ),
  _InsightMapper(
    placeholder: Placeholders.PATHS,
    mapInsights: (insight) async {
      final a = insight.className.toUpperSnakeCase();
      return '...PATH_$a';
    },
  ),
  _InsightMapper(
    placeholder: Placeholders.PATHS_NOT_REDIRECTABLE,
    mapInsights: (insight) async {
      final a = insight.className.toUpperSnakeCase();
      return '...PATH_NOT_REDIRECTABLE_$a';
    },
  ),
  _InsightMapper(
    placeholder: Placeholders.PATHS_ALWAYS_ACCESSIBLE,
    mapInsights: (insight) async {
      final a = insight.className.toUpperSnakeCase();
      return '...PATH_ALWAYS_ACCESSIBLE_$a';
    },
  ),
  _InsightMapper(
    placeholder: Placeholders.PATHS_ACCESSIBLE_ONLY_IF_LOGGED_IN_AND_VERIFIED,
    mapInsights: (insight) async {
      final a = insight.className.toUpperSnakeCase();
      return '...PATH_ACCESSIBLE_ONLY_IF_LOGGED_IN_AND_VERIFIED_$a';
    },
  ),
  _InsightMapper(
    placeholder: Placeholders.PATHS_ACCESSIBLE_ONLY_IF_LOGGED_IN,
    mapInsights: (insight) async {
      final a = insight.className.toUpperSnakeCase();
      return '...PATH_ACCESSIBLE_ONLY_IF_LOGGED_IN_$a';
    },
  ),
  _InsightMapper(
    placeholder: Placeholders.PATHS_ACCESSIBLE_ONLY_IF_LOGGED_OUT,
    mapInsights: (insight) async {
      final a = insight.className.toUpperSnakeCase();
      return '...PATH_ACCESSIBLE_ONLY_IF_LOGGED_OUT_$a';
    },
  ),
  _InsightMapper(
    placeholder: Placeholders.GENERATED_SCREEN_ROUTES,
    mapInsights: (insight) async {
      final a = insight.className.toPascalCase();
      return 'generated${a}Route';
    },
  ),
];

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

enum Placeholders {
  SCREEN_MAKERS,
  PATHS,
  PATHS_NOT_REDIRECTABLE,
  PATHS_ALWAYS_ACCESSIBLE,
  PATHS_ACCESSIBLE_ONLY_IF_LOGGED_IN_AND_VERIFIED,
  PATHS_ACCESSIBLE_ONLY_IF_LOGGED_IN,
  PATHS_ACCESSIBLE_ONLY_IF_LOGGED_OUT,
  GENERATED_SCREEN_ROUTES,
}

typedef _InsightMapper = InsightMapper<ClassInsight<ModelGenerateScreenBindings>, Placeholders>;
