// //.title
// // ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
// //
// // 🇽🇾🇿 & Dev
// //
// // Licencing details are in the LICENSE file in the root directory.
// //
// // ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
// //.title~

// import 'package:args/args.dart';
// import 'package:df_gen_core/df_gen_core.dart';

// import 'generate_screen_access.dart';

// // ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

// /// A command line app for generating screen bindings.
// Future<void> runGenerateScreenBindingsApp(List<String> args) async {
//   await runCommandLineApp(
//     title: 'Generate Screen Bindings',
//     description: 'A command line app for generating screens bindings',
//     args: args,
//     parser: ArgParser()
//       ..addFlag(
//         'help',
//         abbr: 'h',
//         negatable: false,
//         help: 'Help information.',
//       )
//       ..addOption(
//         'roots',
//         abbr: 'r',
//         help: 'Root directory paths separated by `&`.',
//         defaultsTo: 'lib',
//       )
//       ..addOption(
//         'subs',
//         abbr: 's',
//         help: 'Sub-directory paths separated by `&`.',
//         defaultsTo: 'screens',
//       )
//       ..addOption(
//         'patterns',
//         abbr: 'p',
//         help: 'Path patterns separated by `&`.',
//       )
//       ..addOption(
//         'output',
//         abbr: 'o',
//         help: 'Output directory path.',
//         defaultsTo: '.',
//       )
//       ..addOption(
//         'template',
//         abbr: 't',
//         help: 'Template file path.',
//       )
//       ..addOption(
//         'dart-sdk',
//         help: 'Dart SDK path.',
//       ),
//     onResults: (parser, results) {
//       return _ArgsChecker(
//         fallbackDartSdkPath: results['dart-sdk'],
//         templateFilePath: results['template'],
//         rootPaths: splitArg(results['roots'])?.toSet(),
//         subPaths: splitArg(results['subs'])?.toSet(),
//         pathPatterns: splitArg(results['patterns'])?.toSet(),
//         outputFilePath: results['output'],
//       );
//     },
//     action: (parser, results, args) async {
//       await generateScreenBindings(
//         fallbackDartSdkPath: args.fallbackDartSdkPath,
//         templateFilePath: args.templateFilePath,
//         rootDirPaths: args.rootPaths!,
//         subDirPaths: args.subPaths ?? const {},
//         pathPatterns: args.pathPatterns ?? const {},
//       );
//     },
//   );
// }

// // ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

// class _ArgsChecker extends ValidArgsChecker {
//   //
//   //
//   //

//   final Set<String>? rootPaths;
//   final Set<String>? subPaths;
//   final Set<String>? pathPatterns;
//   final String? templateFilePath;
//   final String? outputFilePath;
//   final String? fallbackDartSdkPath;

//   //
//   //
//   //

//   const _ArgsChecker({
//     required this.rootPaths,
//     required this.subPaths,
//     required this.pathPatterns,
//     required this.templateFilePath,
//     required this.outputFilePath,
//     required this.fallbackDartSdkPath,
//   });

//   //
//   //
//   //

//   @override
//   List<dynamic> get args {
//     final paths = [
//       if (this.rootPaths != null) this.rootPaths,
//       if (this.subPaths != null) this.subPaths,
//     ];
//     return [
//       paths,
//       ...paths,
//       if (this.pathPatterns != null) this.pathPatterns,
//       this.templateFilePath,
//       this.outputFilePath,
//       if (fallbackDartSdkPath != null) fallbackDartSdkPath,
//     ];
//   }
// }
