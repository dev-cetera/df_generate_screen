//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// Dart/Flutter (DF) Packages by DevCetra.com & contributors. See LICENSE file
// in root directory.
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import 'package:df_gen_core/df_gen_core.dart';
import 'package:df_log/df_log.dart';
import 'package:df_config/df_config.dart';
import 'package:df_screen_core/df_screen_core.dart';
import 'package:df_string/df_string.dart';

import 'package:path/path.dart' as p;


// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

final generatorConverger = _GeneratorConverger(
  (replacements, templates) async {
    final [template] = templates;

    final a =
        replacements.fold<Map<String, String>>({}, (accumulator, currentMap) {
      currentMap.replacements.forEach((key, value) {
        if (accumulator.containsKey(key)) {
          accumulator[key] = '${accumulator[key]},$value';
        } else {
          accumulator[key] = value;
        }
      });
      return accumulator;
    });

    printRed(a);

    // // Fill the template with the replacement data.
    // final output = replaceData(
    //   template,
    //   {
    //     ...replacements.map((e) => e.replacements),
    //   },
    // );

    // // Determine the output file path.

    // final outputFilePath = p.join('test', '.g.dart');

    // // Write the generated Dart file.
    // await writeFile(outputFilePath, output);

    // // Fix the generated Dart file.
    // await fixDartFile(outputFilePath);

    // // Format the generated Dart file.
    // await fmtDartFile(outputFilePath);

    // // Log a success.
    // debugLogSuccess('Generated "${previewPath(outputFilePath)}"');
  },
);

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

typedef _GeneratorConverger = GeneratorConverger<
    ClassInsight<ModelGenerateScreenBindings>, Enum, String>;
