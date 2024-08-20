//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// Dart/Flutter (DF) Packages by DevCetra.com & contributors. Use of this
// source code is governed by an an MIT-style license that can be found in the
// LICENSE file located in this project's root directory.
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import 'package:df_gen_core/df_gen_core.dart';
import 'package:df_generate_dart_models_core/df_generate_dart_models_core.dart';
import 'package:df_screen_core/df_screen_core.dart';

import 'package:path/path.dart' as p;

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

final _screenKeyMapper = _InsightMapper(
  placeholder: Placeholders.SCREEN_KEY,
  mapInsights: (insight) async {
    final a = insight.annotation.screenKey?.nullIfEmpty;
    final b = insight.className.replaceFirst('Screen', '').toSnakeCase();
    return a ?? b;
  },
);

final _screenSegmentMapper = _InsightMapper(
  placeholder: Placeholders.SCREEN_SEGMENT,
  mapInsights: (insight) async {
    final screenKey = await _screenKeyMapper.mapInsights(insight);
    final path = insight.annotation.path ?? '';
    final screenSegment = p.joinAll(
      [
        path.isNotEmpty && path.startsWith(RegExp(r'[\\/]')) ? path.substring(1) : path,
        screenKey,
      ],
    );
    return screenSegment;
  },
);

final insightMappers = [
  _InsightMapper(
    placeholder: Placeholders.CLASS,
    mapInsights: (insight) async {
      return insight.className;
    },
  ),
  _InsightMapper(
    placeholder: Placeholders.DEFAULT_TITLE,
    mapInsights: (insight) async {
      return insight.annotation.title ??
          insight.className
              .toCamelCase()
              .replaceAll('screen', '')
              .split('_')
              .map((e) => e.capitalize())
              .join(' ');
    },
  ),
  _InsightMapper(
    placeholder: Placeholders.CONFIGURATION_CLASS,
    mapInsights: (insight) async {
      return '${insight.className}Configuration';
    },
  ),
  _InsightMapper(
    placeholder: Placeholders.CLASS_FILE,
    mapInsights: (insight) async {
      return insight.fileName;
    },
  ),
  _screenKeyMapper,
  _InsightMapper(
    placeholder: Placeholders.SCREEN_CONST_KEY,
    mapInsights: (insight) async {
      final screenKey = await _screenKeyMapper.mapInsights(insight);
      return screenKey.toUpperCase();
    },
  ),
  _screenSegmentMapper,
  _InsightMapper(
    placeholder: Placeholders.SCREEN_PATH,
    mapInsights: (insight) async {
      final screenSegment = await _screenSegmentMapper.mapInsights(insight);
      return '/$screenSegment';
    },
  ),
  _InsightMapper(
    placeholder: Placeholders.IS_ACCESSIBLE_ONLY_IF_LOGGED_IN_AND_VERIFIED,
    mapInsights: (insight) async {
      final b = insight.annotation.isAccessibleOnlyIfLoggedInAndVerified ?? false;
      return b.toString();
    },
  ),
  _InsightMapper(
    placeholder: Placeholders.IS_ACCESSIBLE_ONLY_IF_LOGGED_IN,
    mapInsights: (insight) async {
      final b = insight.annotation.isAccessibleOnlyIfLoggedIn ?? false;
      return b.toString();
    },
  ),
  _InsightMapper(
    placeholder: Placeholders.IS_ACCESSIBLE_ONLY_IF_LOGGED_OUT,
    mapInsights: (insight) async {
      final b = insight.annotation.isAccessibleOnlyIfLoggedOut ?? false;
      return b.toString();
    },
  ),
  _InsightMapper(
    placeholder: Placeholders.IS_ALWAYS_ACCESSIBLE,
    mapInsights: (insight) async {
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
  ),
  _InsightMapper(
    placeholder: Placeholders.IS_REDIRECTABLE,
    mapInsights: (insight) async {
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
  ),
  _InsightMapper(
    placeholder: Placeholders.IP0,
    mapInsights: (insight) async {
      final params =
          insight.annotation.internalParameters?.map((e) => FieldUtils.ofOrNull(e)).nonNulls ?? {};
      if (params.isNotEmpty) {
        final a = params.map((e) {
          final fieldName = e.fieldPath!.join('_').toCamelCase();
          final fieldKey = fieldName.toSnakeCase();
          final fieldType = e.fieldType;
          final nullable = e.nullable != false;
          final exclamationMark = nullable ? '' : '!';
          final questionMark = nullable ? '?' : '';
          final fieldK = 'K_${fieldKey.toUpperCase()}';
          return [
            '/// Key corresponding to the value `$fieldName`',
            "static const $fieldK = '$fieldKey';",
            '/// Returns the **internal parameter** with the key `$fieldKey`',
            '/// or [$fieldK].',
            '$fieldType$questionMark get $fieldName => this.arg<$fieldType>($fieldK)$exclamationMark;',
          ].join('\n');
        }).toList()
          ..sort();
        return a.isNotEmpty ? a.join('\n') : '';
      } else {
        return '';
      }
    },
  ),
  _InsightMapper(
    placeholder: Placeholders.IP1,
    mapInsights: (insight) async {
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
  ),
  _InsightMapper(
    placeholder: Placeholders.IP2,
    mapInsights: (insight) async {
      final params =
          insight.annotation.internalParameters?.map((e) => FieldUtils.ofOrNull(e)).nonNulls ?? {};
      if (params.isNotEmpty) {
        final a = params.map((e) {
          final fieldName = e.fieldPath!.join('_').toCamelCase();
          final fieldKey = fieldName.toSnakeCase();
          final fieldK = 'K_${fieldKey.toUpperCase()}';
          return '$fieldK: $fieldName,';
        }).toList()
          ..sort();
        return a.isNotEmpty ? a.join('\n') : '';
      } else {
        return '';
      }
    },
  ),
  _InsightMapper(
    placeholder: Placeholders.QP0,
    mapInsights: (insight) async {
      final params =
          insight.annotation.queryParameters?.map((e) => FieldUtils.ofOrNull(e)).nonNulls ?? {};
      if (params.isNotEmpty) {
        final a = params.map((e) {
          final fieldName = e.fieldPath!.join('_').toCamelCase();
          final fieldKey = fieldName.toSnakeCase();
          final nullable = e.nullable != false;
          final fieldK = 'K_${fieldKey.toUpperCase()}';
          final exclamationMark = nullable ? '' : '!';
          final questionMark = nullable ? '?' : '';
          return [
            '/// Key corresponding to the value `$fieldName`',
            // ignore: unnecessary_string_escapes
            "static const $fieldK = '$fieldKey';",
            '/// Returns the URI **query parameter** with the key `$fieldKey`',
            '/// or [$fieldK].',
            'String$questionMark get $fieldName => this.arg<String>($fieldK)$exclamationMark;',
          ].join('\n');
        }).toList()
          ..sort();
        return a.isNotEmpty ? a.join('\n') : '';
      } else {
        return '';
      }
    },
  ),
  _InsightMapper(
    placeholder: Placeholders.QP1,
    mapInsights: (insight) async {
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
  ),
  _InsightMapper(
    placeholder: Placeholders.QP2,
    mapInsights: (insight) async {
      final params =
          insight.annotation.queryParameters?.map((e) => FieldUtils.ofOrNull(e)).nonNulls ?? {};
      if (params.isNotEmpty) {
        final a = params.map((e) {
          final fieldName = e.fieldPath!.join('_').toCamelCase();
          final nullable = e.nullable != false;
          final fieldKey = fieldName.toSnakeCase();
          final fieldK = 'K_${fieldKey.toUpperCase()}';
          return "${nullable ? "if ($fieldName != null) " : ""}$fieldK: $fieldName,";
        }).toList()
          ..sort();
        return a.isNotEmpty ? a.join('\n') : '';
      } else {
        return '';
      }
    },
  ),
];

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

enum Placeholders {
  CLASS,
  DEFAULT_TITLE,
  CONFIGURATION_CLASS,
  CLASS_FILE,
  SCREEN_KEY,
  SCREEN_CONST_KEY,
  SCREEN_SEGMENT,
  SCREEN_PATH,
  IS_ACCESSIBLE_ONLY_IF_LOGGED_IN_AND_VERIFIED,
  IS_ACCESSIBLE_ONLY_IF_LOGGED_IN,
  IS_ACCESSIBLE_ONLY_IF_LOGGED_OUT,
  IS_ALWAYS_ACCESSIBLE,
  IS_REDIRECTABLE,
  IP0,
  IP1,
  IP2,
  QP0,
  QP1,
  QP2,
}

typedef _InsightMapper = InsightMapper<ClassInsight<ModelGenerateScreenBindings>, Placeholders>;
