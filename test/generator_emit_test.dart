//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// Copyright © dev-cetera.com & contributors.
// MIT license. See https://opensource.org/license/mit
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// Source-level tests for the *generator* source code itself
// (generate_screen, generate_screen_bindings, generate_screen_access). We
// can't run them headlessly without analyzer scaffolding, so we test the
// emitter functions / branches we can statically.

import 'dart:io';

import 'package:test/test.dart';

void main() {
  final bindingsSrc =
      File('lib/src/generate_screen_bindings.dart').readAsStringSync();
  final accessSrc =
      File('lib/src/generate_screen_access.dart').readAsStringSync();
  final screenSrc = File('lib/src/generate_screen.dart').readAsStringSync();

  group('Generator source sanity', () {
    test('generate_screen_bindings.dart has a top-level public function', () {
      expect(
        bindingsSrc,
        contains('Future<void> generateScreenBindings('),
      );
    });

    test('generate_screen_access.dart has a top-level public function', () {
      expect(
        accessSrc,
        contains('Future<void> generateScreenAccess('),
      );
    });

    test('generate_screen.dart has a top-level public function', () {
      expect(screenSrc, contains('Future<void> generateScreen('));
    });
  });

  group('Conflict-detection branches in interpolator', () {
    test('rejects isAccessibleOnlyIfLoggedInAndVerified + '
        'isAccessibleOnlyIfLoggedIn both true', () {
      expect(
        bindingsSrc,
        contains(
          'Cannot set both `isAccessibleOnlyIfLoggedInAndVerified` and '
          '`isAccessibleOnlyIfLoggedIn` to `true`.',
        ),
      );
    });

    test('rejects isAccessibleOnlyIfLoggedInAndVerified + '
        'isAccessibleOnlyIfLoggedOut both true', () {
      expect(
        bindingsSrc,
        contains(
          'Cannot set both `isAccessibleOnlyIfLoggedInAndVerified` and '
          '`isAccessibleOnlyIfLoggedOut` to `true`.',
        ),
      );
    });

    test('rejects isAccessibleOnlyIfLoggedIn + isAccessibleOnlyIfLoggedOut '
        'both true', () {
      expect(
        bindingsSrc,
        contains(
          'Cannot set both `isAccessibleOnlyIfLoggedIn` and '
          '`isAccessibleOnlyIfLoggedOut` to `true`.',
        ),
      );
    });

    test('rejects isRedirectable + required internalParameters', () {
      expect(
        bindingsSrc,
        contains(
          'Cannot set `isRedirectable` to `true` if `internalParameters` '
          'contains required parameters.',
        ),
      );
    });
  });

  group('Emitter helpers reference the right df_screen symbols', () {
    test('___IP3_V2___ accesses .superScreen!.routeState!', () {
      // The original failure caught a stray ')'. Re-check the emitted
      // line in case it regresses.
      final lines = bindingsSrc.split('\n');
      final ipIdx = lines.indexWhere((l) => l.contains('___IP3_V2___'));
      expect(ipIdx, isNot(-1));
      final retIdx = lines.indexWhere(
        (l) => l.contains('super.superScreen!.routeState!.'),
        ipIdx,
      );
      expect(retIdx, isNot(-1));
      final line = lines[retIdx];
      var open = 0, close = 0;
      for (final ch in line.split('')) {
        if (ch == '(') open++;
        if (ch == ')') close++;
      }
      expect(open, close, reason: 'Emitter line has unbalanced parens');
    });

    test('___QP3_V2___ reads from superScreen?.routeState?.uri', () {
      expect(
        bindingsSrc,
        contains('super.superScreen?.routeState?.uri.queryParameters'),
      );
    });
  });
}
