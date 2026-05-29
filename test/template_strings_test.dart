// Detects a stray ')' in the ___IP3_V2___ template emitter:
//   '$fieldType$questionMark get $fieldName =>  super.superScreen!.routeState!.$fieldName)$exclamationMark;'
// The trailing ".$fieldName)" has an unmatched ')'.

import 'dart:io';
import 'package:test/test.dart';

void main() {
  test('___IP3_V2___ generator string is balanced', () async {
    final src = await File(
      'lib/src/generate_screen_bindings.dart',
    ).readAsString();
    // Find the line of the IP3_V2 emitter.
    final lines = src.split('\n');
    final ip3v2Idx = lines.indexWhere((l) => l.contains('___IP3_V2___'));
    expect(ip3v2Idx, isNot(-1), reason: 'must find ___IP3_V2___ marker');
    // The actual template return line is a few lines down.
    final retIdx = lines.indexWhere(
      (l) => l.contains('super.superScreen!.routeState!.'),
      ip3v2Idx,
    );
    expect(retIdx, isNot(-1), reason: 'must find ret line');
    final line = lines[retIdx];
    // Count parens. Ignore inside `\$` interpolations.
    var open = 0;
    var close = 0;
    for (final ch in line.split('')) {
      if (ch == '(') open++;
      if (ch == ')') close++;
    }
    print('IP3_V2 emit line: $line');
    print('Parens: open=$open, close=$close');
    expect(
      open,
      equals(close),
      reason:
          'Template emitter has unbalanced parens — emitted code has syntax error',
    );
  });
}
