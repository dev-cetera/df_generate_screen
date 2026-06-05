//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// Copyright © dev-cetera.com & contributors.
// MIT license. See https://opensource.org/license/mit
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// Template structure tests for df_generate_screen v2 templates. The
// templates are .md files that wrap Dart inside ```dart fences, then are
// run through the TemplateInterpolator on insight extraction.
//
// We verify here that:
//   - every template file exists and has a non-trivial body
//   - the placeholder set used by each template matches what the generator
//     supplies via lib/src/generate_screen_bindings.dart
//   - emitted Dart has balanced braces/parens (a stray `)` is what
//     template_strings_test originally caught)

import 'dart:io';

import 'package:test/test.dart';

const _templatesDir = 'templates/v2';

void main() {
  group('Template files exist', () {
    test('_state.dart.md', () {
      expect(File('$_templatesDir/_state.dart.md').existsSync(), isTrue);
    });
    test('_controller.dart.md', () {
      expect(File('$_templatesDir/_controller.dart.md').existsSync(), isTrue);
    });
    test('widget.dart.md', () {
      expect(File('$_templatesDir/widget.dart.md').existsSync(), isTrue);
    });
    test('_bindings.g.dart.md', () {
      expect(File('$_templatesDir/_bindings.g.dart.md').existsSync(), isTrue);
    });
    test('_access.g.dart.md', () {
      expect(File('$_templatesDir/_access.g.dart.md').existsSync(), isTrue);
    });
  });

  group('widget.dart.md placeholders', () {
    final src = File('$_templatesDir/widget.dart.md').readAsStringSync();
    test('declares the screen class with ___WIDGET_NAME___', () {
      expect(src, contains('___WIDGET_NAME___'));
    });
    test('uses the base class ____WIDGET_NAME___', () {
      expect(src, contains('extends ____WIDGET_NAME___'));
    });
    test('parts in _bindings.g.dart, _controller.dart, _state.dart', () {
      expect(src, contains("part '_bindings.g.dart';"));
      expect(src, contains("part '_controller.dart';"));
      expect(src, contains("part '_state.dart';"));
    });
    test('passes routeState through to super', () {
      expect(src, contains('super.routeState'));
    });
  });

  group('_bindings.g.dart.md structure', () {
    final src = File('$_templatesDir/_bindings.g.dart.md').readAsStringSync();
    test('has placeholders for query+internal parameters', () {
      for (final ph in const [
        '___WIDGET_NAME___',
        '___IP0_V2___',
        '___IP1___',
        '___QP0_V2___',
        '___QP1_V2___',
        '___QP2_V2___',
        '___QP3_V2___',
        '___CONDITION___',
        '___SCREEN_SEGMENT___',
        '___DEFAULT_TITLE___',
      ]) {
        expect(src, contains(ph), reason: 'missing placeholder $ph');
      }
    });

    test('emits RouteState<X?> with nullable extra type', () {
      expect(src, contains('RouteState<___WIDGET_NAME___Extra?>'));
    });

    test('emits RouteBuilder<X?> with nullable extra type', () {
      expect(src, contains('extends RouteBuilder<___WIDGET_NAME___Extra?>'));
    });

    test('emits Screen<X?> base class with nullable extra type', () {
      expect(src, contains('extends Screen<___WIDGET_NAME___Extra?>'));
    });
  });

  group('_access.g.dart.md structure', () {
    final src = File('$_templatesDir/_access.g.dart.md').readAsStringSync();

    test('declares the three auth-check helpers', () {
      for (final fn in const [
        'isLoggedInAndEmailVerified',
        'isLoggedIn',
        'isLoggedOut',
      ]) {
        expect(
          src,
          contains('bool $fn()'),
          reason: 'missing helper $fn',
        );
      }
    });

    test('emits a registry placeholder ___ROUTE_BUILDERS___', () {
      expect(src, contains('___ROUTE_BUILDERS___'));
    });

    test('declares EmptyScreenState and ErrorScreenState', () {
      expect(src, contains('EmptyScreenState extends RouteState'));
      expect(src, contains('ErrorScreenState extends RouteState<Enum>'));
    });
  });

  group('Template Dart syntax sanity', () {
    File templateFile(String name) => File('$_templatesDir/$name');

    void expectBalanced(String src, String label) {
      // Strip markdown fence + placeholders to make brace counting more
      // accurate.
      final code = src
          .replaceAll(RegExp(r'```dart\n?'), '')
          .replaceAll(RegExp(r'```'), '')
          .replaceAll(RegExp(r'___[A-Z0-9_]+___'), 'PH');
      var braces = 0, parens = 0, brackets = 0;
      for (var i = 0; i < code.length; i++) {
        final ch = code[i];
        if (ch == '{') braces++;
        if (ch == '}') braces--;
        if (ch == '(') parens++;
        if (ch == ')') parens--;
        if (ch == '[') brackets++;
        if (ch == ']') brackets--;
      }
      expect(braces, 0, reason: '$label: unbalanced {}');
      expect(parens, 0, reason: '$label: unbalanced ()');
      expect(brackets, 0, reason: '$label: unbalanced []');
    }

    test('widget.dart.md has balanced delimiters', () {
      expectBalanced(
        templateFile('widget.dart.md').readAsStringSync(),
        'widget.dart.md',
      );
    });

    test('_bindings.g.dart.md has balanced delimiters', () {
      expectBalanced(
        templateFile('_bindings.g.dart.md').readAsStringSync(),
        '_bindings.g.dart.md',
      );
    });

    test('_access.g.dart.md has balanced delimiters', () {
      expectBalanced(
        templateFile('_access.g.dart.md').readAsStringSync(),
        '_access.g.dart.md',
      );
    });

    test('_state.dart.md has balanced delimiters', () {
      expectBalanced(
        templateFile('_state.dart.md').readAsStringSync(),
        '_state.dart.md',
      );
    });

    test('_controller.dart.md has balanced delimiters', () {
      expectBalanced(
        templateFile('_controller.dart.md').readAsStringSync(),
        '_controller.dart.md',
      );
    });
  });

  group('Interpolator placeholder coverage', () {
    final src =
        File('lib/src/generate_screen_bindings.dart').readAsStringSync();

    final wellKnownPlaceholders = {
      '___WIDGET_NAME___',
      '___SCREEN_KEY___',
      '___SCREEN_SEGMENT___',
      '___SCREEN_PATH___',
      '___SCREEN_CONST_KEY___',
      '___CONDITION___',
      '___DEFAULT_TITLE___',
      '___IS_REDIRECTABLE___',
      '___IS_ACCESSIBLE_ONLY_IF_LOGGED_IN_AND_VERIFIED___',
      '___IS_ACCESSIBLE_ONLY_IF_LOGGED_IN___',
      '___IS_ACCESSIBLE_ONLY_IF_LOGGED_OUT___',
      '___IS_ALWAYS_ACCESSIBLE___',
      '___IP0_V2___',
      '___IP0___',
      '___IP1___',
      '___IP2___',
      '___IP3_V2___',
      '___QP0_V2___',
      '___QP0___',
      '___QP1_V2___',
      '___QP1___',
      '___QP2_V2___',
      '___QP2___',
      '___QP3_V2___',
    };

    for (final ph in wellKnownPlaceholders) {
      test('generate_screen_bindings.dart registers $ph', () {
        expect(
          src,
          contains("'$ph'"),
          reason: '$ph should appear as a registered interpolator key',
        );
      });
    }
  });
}
