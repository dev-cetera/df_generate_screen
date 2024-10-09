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

import 'package:df_config/df_config.dart';
import 'package:df_gen_core/df_gen_core.dart';
import 'package:df_log/df_log.dart';
import 'package:df_screen_core/df_screen_core.dart';
import 'package:df_string/df_string.dart';

import '_extract_class_insights_from_dart_file.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

Future<void> generateScreenAccess({
  required Set<String> rootDirPaths,
  required String outputFilePath,
  Set<String> pathPatterns = const {},
  Set<String> subDirPaths = const {},
  String? fallbackDartSdkPath,
  required String templateFilePath,
}) async {
  // Notify start.
  printBlue('Starting generator. Please wait...');

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
    await loadFileFromPathOrUrl(templateFilePath),
  );

  // ---------------------------------------------------------------------------

  // Create context for the Dart analyzer.
  final analysisContextCollection = createDartAnalysisContextCollection(
    sourceFileExporer.dirPathGroups.first.paths,
    fallbackDartSdkPath,
  );

  final classInsights = <ClassInsight<ModelGenerateScreenBindings>>[];

  // For each file...
  for (final filePathResult in sourceFileExplorerResults.filePathResults
      .where((e) => e.category == _Categories.DART)) {
    final filePath = filePathResult.path;

    // Extract insights from the file.
    final temp = await extractClassInsightsFromDartFile(
      analysisContextCollection,
      filePath,
    );

    classInsights.addAll(temp);
  }

  if (classInsights.isNotEmpty) {
    final output = template.replaceData(
      {
        Placeholders.SCREEN_MAKERS.placeholder: classInsights.map(
          (e) {
            final a = e.className.toPascalCase();
            return 'maker$a';
          },
        ).join(','),
        Placeholders.PATHS.placeholder: classInsights.map(
          (e) {
            final a = e.className.toUpperSnakeCase();
            return '...PATH_$a';
          },
        ).join(','),
        Placeholders.PATHS_NOT_REDIRECTABLE.placeholder: classInsights.map(
          (e) {
            final a = e.className.toUpperSnakeCase();
            return '...PATH_NOT_REDIRECTABLE_$a';
          },
        ).join(','),
        Placeholders.PATHS_ALWAYS_ACCESSIBLE.placeholder: classInsights.map(
          (e) {
            final a = e.className.toUpperSnakeCase();
            return '...PATH_ALWAYS_ACCESSIBLE_$a';
          },
        ).join(','),
        Placeholders.PATHS_ACCESSIBLE_ONLY_IF_LOGGED_IN_AND_VERIFIED
            .placeholder: classInsights.map(
          (e) {
            final a = e.className.toUpperSnakeCase();
            return '...PATH_ACCESSIBLE_ONLY_IF_LOGGED_IN_AND_VERIFIED_$a';
          },
        ).join(','),
        Placeholders.PATHS_ACCESSIBLE_ONLY_IF_LOGGED_IN.placeholder:
            classInsights.map(
          (e) {
            final a = e.className.toUpperSnakeCase();
            return '...PATH_ACCESSIBLE_ONLY_IF_LOGGED_IN_$a';
          },
        ).join(','),
        Placeholders.PATHS_ACCESSIBLE_ONLY_IF_LOGGED_OUT.placeholder:
            classInsights.map(
          (e) {
            final a = e.className.toUpperSnakeCase();
            return '...PATH_ACCESSIBLE_ONLY_IF_LOGGED_OUT_$a';
          },
        ).join(','),
        Placeholders.GENERATED_SCREEN_ROUTES.placeholder: classInsights.map(
          (e) {
            final a = e.className.toPascalCase();
            return 'generated${a}Route';
          },
        ).join(','),
      },
    );

    // Write the generated Dart file.
    await writeFile(outputFilePath, output);

    // Fix the generated Dart file.
    await fixDartFile(outputFilePath);

    // Format the generated Dart file.
    await fmtDartFile(outputFilePath);

    // Log a success.
    printGreen('Generated "${previewPath(outputFilePath)}"');
  }

  // await writeFile(outputFilePath, outputContent);

  // ---------------------------------------------------------------------------

  // Notify end.
  printPurple('Done!');
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

enum _Categories {
  DART,
}

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
