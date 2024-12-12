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

import 'package:df_generate_dart_models_core/df_generate_dart_models_core.dart';
import 'package:df_generate_dart_models_core/df_generate_dart_models_core_utils.dart'
    show DartFromRecordOnDartObjectX;

import 'package:path/path.dart' as p;
import 'package:df_gen_core/df_gen_core.dart';
import 'package:df_screen_core/df_screen_core.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

Future<List<ClassInsight<ModelGenerateScreenBindings>>> extractInsightsFromFile(
  String filePath,
  dynamic analysisContextCollection,
) async {
  late ModelGenerateScreenBindings temp;
  final analyzer = DartAnnotatedClassAnalyzer(
    filePath: filePath,
    analysisContextCollection: analysisContextCollection,
  );

  final insights = <ClassInsight<ModelGenerateScreenBindings>>[];
  await analyzer.analyze(
    inclClassAnnotations: {ModelGenerateScreenBindings.CLASS_NAME},
    onClassAnnotationField: (params) async => temp = _updateFromClassAnnotationField(temp, params),
    onPreAnalysis: (_, __) => temp = const ModelGenerateScreenBindings(),
    onPostAnalysis: (params) {
      final fullPathName = params.fullFilePath;
      final fileName = p.basename(fullPathName);
      final dirPath = p.dirname(fullPathName);
      final insight = ClassInsight<ModelGenerateScreenBindings>(
        className: params.className,
        annotation: temp,
        dirPath: dirPath,
        fileName: fileName,
      );
      insights.add(insight);
    },
  );
  return insights;
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

ModelGenerateScreenBindings _updateFromClassAnnotationField(
  ModelGenerateScreenBindings annotation,
  OnClassAnnotationFieldParams params,
) {
  switch (params.fieldName) {
    case ModelGenerateScreenBindingsFieldNames.args:
      return annotation.copyWith(
        args: params.fieldValue.toMapValue()?.map(
              (k, v) => MapEntry(k?.toStringValue(), v?.toStringValue()),
            ),
      );
    case ModelGenerateScreenBindingsFieldNames.isAccessibleOnlyIfLoggedInAndVerified:
      return annotation.copyWith(
        isAccessibleOnlyIfLoggedInAndVerified: params.fieldValue.toBoolValue(),
      );
    case ModelGenerateScreenBindingsFieldNames.isAccessibleOnlyIfLoggedIn:
      return annotation.copyWith(
        isAccessibleOnlyIfLoggedIn: params.fieldValue.toBoolValue(),
      );
    case ModelGenerateScreenBindingsFieldNames.isAccessibleOnlyIfLoggedOut:
      return annotation.copyWith(
        isAccessibleOnlyIfLoggedOut: params.fieldValue.toBoolValue(),
      );
    case ModelGenerateScreenBindingsFieldNames.isRedirectable:
      return annotation.copyWith(
        isRedirectable: params.fieldValue.toBoolValue(),
      );
    case ModelGenerateScreenBindingsFieldNames.path:
      return annotation.copyWith(
        path: params.fieldValue.toStringValue(),
      );
    case ModelGenerateScreenBindingsFieldNames.queryParameters:
      return annotation.copyWith(
        queryParameters: {
          ...?annotation.queryParameters,
          ...?params.fieldValue.toSetValue()?.map((e) {
            final x = DartFromRecordOnDartObjectX(e);
            final field = FieldModel(
              fieldPath: x.fieldPathFromRecord()!,
              fieldType: x.fieldTypeFromRecord()!,
              nullable: x.nullableFromRecord()!,
            );
            return field.toRecord;
          }),
        },
      );
    case ModelGenerateScreenBindingsFieldNames.internalParameters:
      return annotation.copyWith(
        internalParameters: {
          ...?annotation.internalParameters,
          ...?params.fieldValue.toSetValue()?.map((e) {
            final x = DartFromRecordOnDartObjectX(e);
            final field = FieldModel(
              fieldPath: x.fieldPathFromRecord()!,
              fieldType: x.fieldTypeFromRecord()!,
              nullable: x.nullableFromRecord()!,
            );
            return field.toRecord;
          }),
        },
      );
    case ModelGenerateScreenBindingsFieldNames.title:
      return annotation.copyWith(
        title: params.fieldValue.toStringValue(),
      );
    case ModelGenerateScreenBindingsFieldNames.className:
      return annotation.copyWith(
        className: params.fieldValue.toStringValue(),
      );
    case ModelGenerateScreenBindingsFieldNames.screenKey:
      return annotation.copyWith(
        screenKey: params.fieldValue.toStringValue(),
      );
    case ModelGenerateScreenBindingsFieldNames.keyStringCase:
      return annotation.copyWith(
        keyStringCase: params.fieldValue.toStringValue(),
      );
    default:
      return ModelGenerateScreenBindings.of(annotation);
  }
}
