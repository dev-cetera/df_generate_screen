//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// Dart/Flutter (DF) Packages by DevCetra.com & contributors. See LICENSE file
// in root directory.
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import 'package:analyzer/dart/analysis/analysis_context_collection.dart';
import 'package:df_generate_dart_models_core/df_generate_dart_models_core.dart';

import 'package:path/path.dart' as p;
import 'package:df_gen_core/df_gen_core.dart';
import 'package:df_screen_core/df_screen_core.dart';

import '/src/_index.g.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

Future<List<_ClassInsight>> extractClassInsightsFromDartFile(
  AnalysisContextCollection analysisContextCollection,
  String filePath,
) async {
  late ModelGenerateScreenBindings temp;
  final analyzer = DartAnnotatedClassAnalyzer(
    filePath: filePath,
    analysisContextCollection: analysisContextCollection,
  );

  final insights = <_ClassInsight>[];
  await analyzer.analyze(
    inclClassAnnotations: {ModelGenerateScreenBindings.CLASS_NAME},
    // onClassAnnotationField: (params) async =>
    //     temp = _updateFromClassAnnotationField(temp, params),
    onPreAnalysis: (_, __) => temp = const ModelGenerateScreenBindings(),
    onPostAnalysis: (params) {
      // final fullPathName = params.fullFilePath;
      // final fileName = p.basename(fullPathName);
      // final dirPath = p.dirname(fullPathName);
      // final insight = _ClassInsight(
      //   className: params.className,
      //   annotation: temp,
      //   dirPath: dirPath,
      //   fileName: fileName,
      // );
      // insights.add(insight);
    },
  );
  return insights;
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

// ModelGenerateScreenBindings _updateFromClassAnnotationField(
//   ModelGenerateScreenBindings annotation,
//   OnClassAnnotationFieldParams params,
// ) {
//   return ModelGenerateScreenBindings.of(annotation);
//   // switch (params.fieldName) {
//   //   case ModelGenerateScreenBindingsFieldNames.args:
//   //     return annotation.copyWith(
//   //       ModelGenerateScreenBindings(
//   //         args: params.fieldValue.toMapValue()?.map(
//   //               (k, v) => MapEntry(k?.toStringValue(), v?.toStringValue()),
//   //             ),
//   //       ),
//   //     );
//   //   case ModelGenerateScreenBindingsFieldNames.isAccessibleOnlyIfLoggedInAndVerified:
//   //     return annotation.copyWith(
//   //       ModelGenerateScreenBindings(
//   //         isAccessibleOnlyIfLoggedInAndVerified: params.fieldValue.toBoolValue(),
//   //       ),
//   //     );
//   //   case ModelGenerateScreenBindingsFieldNames.isAccessibleOnlyIfLoggedIn:
//   //     return annotation.copyWith(
//   //       ModelGenerateScreenBindings(
//   //         isAccessibleOnlyIfLoggedIn: params.fieldValue.toBoolValue(),
//   //       ),
//   //     );
//   //   case ModelGenerateScreenBindingsFieldNames.isAccessibleOnlyIfLoggedOut:
//   //     return annotation.copyWith(
//   //       ModelGenerateScreenBindings(
//   //         isAccessibleOnlyIfLoggedOut: params.fieldValue.toBoolValue(),
//   //       ),
//   //     );
//   //   case ModelGenerateScreenBindingsFieldNames.isRedirectable:
//   //     return annotation.copyWith(
//   //       ModelGenerateScreenBindings(
//   //         isRedirectable: params.fieldValue.toBoolValue(),
//   //       ),
//   //     );
//   //   case ModelGenerateScreenBindingsFieldNames.path:
//   //     return annotation.copyWith(
//   //       ModelGenerateScreenBindings(
//   //         path: params.fieldValue.toStringValue(),
//   //       ),
//   //     );
//   //   case ModelGenerateScreenBindingsFieldNames.queryParameters:
//   //     return annotation.copyWith(
//   //       ModelGenerateScreenBindings(
//   //         queryParameters: {
//   //           ...?annotation.queryParameters,
//   //           ...?params.fieldValue.toSetValue()?.map((e) {
//   //             final field = FieldModel(
//   //               fieldPath: e.fieldPathFromRecord()!,
//   //               fieldType: e.fieldTypeFromRecord()!,
//   //               nullable: e.nullableFromRecord()!,
//   //             );
//   //             return field.toRecord;
//   //           }),
//   //         },
//   //       ),
//   //     );
//   //   case ModelGenerateScreenBindingsFieldNames.internalParameters:
//   //     return annotation.copyWith(
//   //       ModelGenerateScreenBindings(
//   //         internalParameters: {
//   //           ...?annotation.internalParameters,
//   //           ...?params.fieldValue.toSetValue()?.map((e) {
//   //             final field = FieldModel(
//   //               fieldPath: e.fieldPathFromRecord()!,
//   //               fieldType: e.fieldTypeFromRecord()!,
//   //               nullable: e.nullableFromRecord()!,
//   //             );
//   //             return field.toRecord;
//   //           }),
//   //         },
//   //       ),
//   //     );
//   //   case ModelGenerateScreenBindingsFieldNames.title:
//   //     return annotation.copyWith(
//   //       ModelGenerateScreenBindings(
//   //         title: params.fieldValue.toStringValue(),
//   //       ),
//   //     );
//   //   case ModelGenerateScreenBindingsFieldNames.className:
//   //     return annotation.copyWith(
//   //       ModelGenerateScreenBindings(
//   //         className: params.fieldValue.toStringValue(),
//   //       ),
//   //     );
//   //   case ModelGenerateScreenBindingsFieldNames.screenKey:
//   //     return annotation.copyWith(
//   //       ModelGenerateScreenBindings(
//   //         screenKey: params.fieldValue.toStringValue(),
//   //       ),
//   //     );
//   //   case ModelGenerateScreenBindingsFieldNames.keyStringCase:
//   //     return annotation.copyWith(
//   //       ModelGenerateScreenBindings(
//   //         keyStringCase: params.fieldValue.toStringValue(),
//   //       ),
//   //     );
//   //   default:
//   //     return ModelGenerateScreenBindings.of(annotation);
//   // }
// }

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

typedef _ClassInsight = ClassInsight<ModelGenerateScreenBindings>;
