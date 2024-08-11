//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// 🇽🇾🇿 & Dev
//
// Licencing details are in the LICENSE file in the root directory.
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import 'package:analyzer/dart/analysis/analysis_context_collection.dart';
import 'package:df_gen_core/df_gen_core.dart';
import 'package:df_log/df_log.dart';
import 'package:df_screen_core/df_screen_core.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

Future<void> generateScreenAccess({
  required Set<String> rootDirPaths,
  required String outputFilePath,
  Set<String> pathPatterns = const {},
  Set<String> subDirPaths = const {},
  String? fallbackDartSdkPath,
  String? templateFilePath,
}) async {
  // Notify start.
  debugLogStart('Starting generator. Please wait...');

  // Explore all source paths.
  final sourceFileExporer = PathExplorer(
    categorizedPathPatterns: const [
      CategorizedPattern(
        category: _Categories.DART,
        pattern: r'.*\.dart$',
      ),
    ],
    dirPathGroups: {
      CombinedPaths(
        rootDirPaths,
        subPaths: subDirPaths,
        pathPatterns: pathPatterns,
      ),
    },
  );
  final sourceFileExplorerResults = await sourceFileExporer.explore();

  final template = extractCodeFromMarkdown(
    await loadFileFromGitHub(
      username: 'robmllze',
      repo: 'df_generate_screen',
      filePath: [
        templateFilePath ?? 'templates/access.dart.md',
      ].join('/'),
    ),
  );

  printRed(template.length);

  // ---------------------------------------------------------------------------

  // Create context for the Dart analyzer.
  final analysisContextCollection = createDartAnalysisContextCollection(
    sourceFileExporer.dirPathGroups.first.paths,
    fallbackDartSdkPath,
  );

  // For each file...
  for (final filePathResult in sourceFileExplorerResults.filePathResults
      .where((e) => e.category == _Categories.DART)) {
    final filePath = filePathResult.path;

    // Extract insights from the file.
    final classInsights = await extractClassInsightsFromDartFile1(
      analysisContextCollection,
      filePath,
    );

    // if (classInsights.isNotEmpty) {
    //   // Converge what was gathered to generate the output.
    //   // await generatorConverger.converge(
    //   //   classInsights,
    //   //   [template],
    //   //   [
    //   //     ...insightMappersA,
    //   //     ...insightMappersB,
    //   //   ],
    //   // );
    // }
  }

  // final screenClassNames = <String>{};
  // for (final dirPath in combinePathSets([rootDirPaths, subDirPaths])) {
  //   final filePaths = await listFilePaths(dirPath);
  //   if (filePaths != null) {
  //     filePaths.sort();
  //     for (final filePath in filePaths) {
  //       if (isGeneratedDartFilePath(filePath) && matchesAnyPathPattern(filePath, pathPatterns)) {
  //         var screenFileKey = getBaseName(filePath).replaceAll('.g.dart', '');
  //         screenFileKey =
  //             screenFileKey.startsWith('_') ? screenFileKey.substring(1) : screenFileKey;
  //         final contents = await readFile(filePath);
  //         if (contents != null) {
  //           final x = RegExp(r'''const +_CLASS += +["'](\w+)["'];''');
  //           final match = x.firstMatch(contents);
  //           if (match != null && match.groupCount == 1) {
  //             final screenClassName = match.group(1);
  //             if (screenClassName != null) {
  //               screenClassNames1.add(screenClassName);
  //             }
  //           }
  //         }
  //       }
  //     }
  //   }
  // }
  // final sorted = screenClassNames1.toList()..sort();
  // final keys = sorted.map((e) => e.toSnakeCase().toUpperCase());
  // final a = sorted.map((e) => 'maker$e').join(',');
  // final b = keys.map((e) => '...PATH_$e').join(',');
  // final c = keys.map((e) => '...PATH_NOT_REDIRECTABLE_$e').join(',');
  // final d = keys.map((e) => '...PATH_ALWAYS_ACCESSIBLE_$e').join(',');
  // final e = keys.map((e) => '...PATH_ACCESSIBLE_ONLY_IF_LOGGED_IN_AND_VERIFIED_$e').join(',');
  // final f = keys.map((e) => '...PATH_ACCESSIBLE_ONLY_IF_LOGGED_IN_$e').join(',');
  // final g = keys.map((e) => '...PATH_ACCESSIBLE_ONLY_IF_LOGGED_OUT_$e').join(',');
  // final h = sorted.map((e) => 'generated${e}Route').join(',');
  // final template = (await readSnippetsFromMarkdownFile(templateFilePath)).join('\n');
  // final outputContent = replaceData(template, {
  //   '___SCREEN_MAKERS___': a,
  //   '___PATHS___': b,
  //   '___PATHS_NOT_REDIRECTABLE___': c,
  //   '___PATHS_ALWAYS_ACCESSIBLE___': d,
  //   '___PATHS_ACCESSIBLE_ONLY_IF_LOGGED_IN_AND_VERIFIED___': e,
  //   '___PATHS_ACCESSIBLE_ONLY_IF_LOGGED_IN___': f,
  //   '___PATHS_ACCESSIBLE_ONLY_IF_LOGGED_OUT___': g,
  //   '___GENERATED_SCREEN_ROUTES___': h,
  // });
  // await writeFile(outputFilePath, outputContent);
  // Here().debugLogStop('Done!');
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

Future<List<ClassInsight1>> extractClassInsightsFromDartFile1(
  AnalysisContextCollection analysisContextCollection,
  String filePath,
) async {
  //late ModelGenerateScreenBindings temp;
  // final analyzer = DartAnnotatedClassAnalyzer(
  //   filePath: filePath,
  //   analysisContextCollection: analysisContextCollection,
  // );

  // //final insights = <_ClassInsight>[];
  // await analyzer.analyze(
  //   inclClassAnnotations: {ModelGenerateScreenBindingsFieldNames.className},
  //   // onClassAnnotationField: (params) async =>
  //   //     temp = _updateFromClassAnnotationField(temp, params),
  //   //onPreAnalysis: (_, __) => temp = const ModelGenerateScreenBindings(),
  //   onPostAnalysis: (params) {
  //     // final fullPathName = params.fullFilePath;
  //     // final fileName = p.basename(fullPathName);
  //     // final dirPath = p.dirname(fullPathName);
  //     // final insight = _ClassInsight(
  //     //   className: params.className,
  //     //   annotation: temp,
  //     //   dirPath: dirPath,
  //     //   fileName: fileName,
  //     // );
  //     // insights.add(insight);
  //   },
  // );
  return [];
}

enum _Categories {
  DART,
}

typedef ClassInsight1 = ClassInsight<ModelGenerateScreenBindings>;
