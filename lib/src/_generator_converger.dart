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
import 'package:df_string/df_string.dart';

import 'package:path/path.dart' as p;

import 'generate_screen/_insight.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

final generatorConverger = _GeneratorConverger(
  (replacements, templates) async {
    final [
      controllerTemplate,
      screenTemplate,
      viewTemplate,
      bindingsTemplate,
    ] = templates;

    for (final replacement in replacements) {
      final templates = {
        replacement.insight.controllerFileName: controllerTemplate,
        replacement.insight.screenFileName: screenTemplate,
        replacement.insight.viewFileName: viewTemplate,
        replacement.insight.bindingsFileName: bindingsTemplate,
      };
      for (final entry in templates.entries) {
        final fileName = entry.key;
        final template = entry.value;

        // Fill the template with the replacement data.
        final output = replaceData(
          template,
          replacement.replacements,
        );

        // Determine the output file path.
        final folderName = replacement.insight.screenClassName.toSnakeCase();
        final outputFilePath =
            p.join(replacement.insight.path, folderName, fileName);

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
  },
);

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

typedef _GeneratorConverger = GeneratorConverger<Insight, Enum, String>;
