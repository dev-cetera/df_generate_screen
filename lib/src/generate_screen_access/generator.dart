//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// 🇽🇾🇿 & Dev
//
// Licencing details are in the LICENSE file in the root directory.
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import 'package:df_config/df_config.dart';
import 'package:df_gen_core/df_gen_core.dart';
import 'package:df_log/df_log.dart';
import 'package:df_string/df_string.dart';

import '_extract_class_insights_from_dart_file.dart';
import '_insight_mappers.dart';

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

  // ---------------------------------------------------------------------------

  // Create context for the Dart analyzer.
  final analysisContextCollection = createDartAnalysisContextCollection(
    sourceFileExporer.dirPathGroups.first.paths,
    fallbackDartSdkPath,
  );

  // For each file...
  for (final filePathResult
      in sourceFileExplorerResults.filePathResults.where((e) => e.category == _Categories.DART)) {
    final filePath = filePathResult.path;

    // Extract insights from the file.
    final classInsights = await extractClassInsightsFromDartFile(
      analysisContextCollection,
      filePath,
    );

    if (classInsights.isNotEmpty) {
      final output = template.replaceData(
        {
          Placeholders.SCREEN_MAKERS.placeholder: classInsights.map(
            (e) {
              final a = e.className.toPascalCase();
              return 'maker$a,';
            },
          ),
          Placeholders.PATHS.placeholder: classInsights.map(
            (e) {
              final a = e.className.toUpperSnakeCase();
              return '...PATH_$a';
            },
          ),
          Placeholders.PATHS_NOT_REDIRECTABLE.placeholder: classInsights.map(
            (e) {
              final a = e.className.toUpperSnakeCase();
              return '...PATH_NOT_REDIRECTABLE_$a';
            },
          ),
          Placeholders.PATHS_ALWAYS_ACCESSIBLE.placeholder: classInsights.map(
            (e) {
              final a = e.className.toUpperSnakeCase();
              return '...PATH_ALWAYS_ACCESSIBLE_$a';
            },
          ),
          Placeholders.PATHS_ACCESSIBLE_ONLY_IF_LOGGED_IN_AND_VERIFIED.placeholder:
              classInsights.map(
            (e) {
              final a = e.className.toUpperSnakeCase();
              return '...PATH_ACCESSIBLE_ONLY_IF_LOGGED_IN_AND_VERIFIED_$a';
            },
          ),
          Placeholders.PATHS_ACCESSIBLE_ONLY_IF_LOGGED_IN.placeholder: classInsights.map(
            (e) {
              final a = e.className.toUpperSnakeCase();
              return '...PATH_ACCESSIBLE_ONLY_IF_LOGGED_IN_$a';
            },
          ),
          Placeholders.PATHS_ACCESSIBLE_ONLY_IF_LOGGED_OUT.placeholder: classInsights.map(
            (e) {
              final a = e.className.toUpperSnakeCase();
              return '...PATH_ACCESSIBLE_ONLY_IF_LOGGED_OUT_$a';
            },
          ),
          Placeholders.GENERATED_SCREEN_ROUTES.placeholder: classInsights.map(
            (e) {
              final a = e.className.toPascalCase();
              return 'generated${a}Route';
            },
          ),
        },
      );

      // Write the generated Dart file.
      await writeFile(outputFilePath, output);

      // Fix the generated Dart file.
      await fixDartFile(outputFilePath);

      // Format the generated Dart file.
      await fmtDartFile(outputFilePath);

      // Log a success.
      debugLogSuccess('Generated "${previewPath(outputFilePath)}"');
    }
  }

  // await writeFile(outputFilePath, outputContent);
  Here().debugLogStop('Done!');
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

enum _Categories {
  DART,
}
