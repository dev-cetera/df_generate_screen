// //.title
// // ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
// //
// // 🇽🇾🇿 & Dev
// //
// // Licencing details are in the LICENSE file in the root directory.
// //
// // ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
// //.title~

// import 'package:analyzer/dart/analysis/analysis_context_collection.dart';
// import 'package:analyzer/dart/constant/value.dart';
// import 'package:df_gen_core/df_gen_core.dart';
// import 'package:df_log/df_log.dart';
// import 'package:path/path.dart' as p;

// part 'generate_parts/_generate_screen_bindings_file.dart';
// part 'generate_parts/_replacements.dart';

// // ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

// /// Note: Returns all the annotated screen class names.
// Future<Set<String>> generateScreenBindings({
//   String? fallbackDartSdkPath,
//   String? templateFilePath,
//   required Set<String> rootDirPaths,
//   Set<String> subDirPaths = const {},
//   Set<String> pathPatterns = const {},
// }) async {
//   // Notify start.
//   debugLogStart('Starting generator. Please wait...');

//   final controllerTemplate = extractCodeFromMarkdown(
//     await loadFileFromGitHub(
//       username: 'robmllze',
//       repo: 'df_generate_screen',
//       filePath: [
//         templateFilePath ?? 'templates/screen_access.dart.md',
//       ].join('/'),
//     ),
//   );

//   final classNames = <String>{};
//   await generateFromTemplates(
//     fallbackDartSdkPath: fallbackDartSdkPath,
//     rootDirPaths: rootDirPaths,
//     subDirPaths: subDirPaths,
//     pathPatterns: pathPatterns,
//     templateFilePaths: {templateFilePath},
//     generateForFile: (collection, filePath, templates, _) async {
//       final temp = await _generateForFile(
//         collection,
//         filePath,
//         templates,
//       );
//       classNames.addAll(temp);
//     },
//   );
//   Here().debugLogStop('Done!');
//   return classNames;
// }
