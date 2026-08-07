# Changelog

## [0.9.1]

- chore: bump `df_string` to `^0.4.0`, `df_gen_core` to `^0.8.1`, and `df_generate_dart_models_core` to `^0.11.1`, adopting df_string 0.4.0's case-conversion digit-boundary change. Generated screen scaffolding that runs case conversions on identifiers with embedded digits emits the new form on the next generation run. All 55 tests pass against df_string 0.4.0.

## [0.9.0]

- Released @ 6/2026 (UTC)
- Fix: collision detection for multiple `@ModelGenerateScreenBindings` classes in one file — logs the colliding class name and skips the duplicate write instead of silently overwriting
- Fix: `fieldPath` access normalised via `FieldUtils.fieldPathOrNull` (was `.join('_')` on `Object?` after the upstream `fieldPath` slot became polymorphic)
- Fix: top-level catch logs the actual exception, not just a generic message
- Bumps cross-package constraints to the 0.8/0.11/0.7/0.7 line (df_gen_core, df_generate_dart_models_core, df_generate_dart_indexes, df_screen_core)

## [0.8.1]

- Released @ 7/2025 (UTC)
- Update dependencies

## [0.8.0]

- Released @ 7/2025 (UTC)
- Update dependencies

## [0.7.6]

- Released @ 6/2025 (UTC)
- Update dependencies

## [0.7.5]

- Released @ 6/2025 (UTC)
- Update dependencies

## [0.7.4]

- Released @ 6/2025 (UTC)
- Update dependencies

## [0.7.3]

- Released @ 6/2025 (UTC)
- Update dependencies

## [0.7.2]

- Released @ 6/2025 (UTC)
- chore: Update dendendencies

## [0.7.1]

- Released @ 6/2025 (UTC)
- chore: Update dependencies

## [0.7.0]

- Released @ 6/2025 (UTC)
- chore: Update dependencies

## [0.6.6]

- Released @ 3/2025 (UTC)
- chore: Update dependencies

## [0.6.5]

- Released @ 2/2025 (UTC)
- chore: Upgrade dependencies

## [0.6.4]

- Released @ 1/2025 (UTC)
- chore: Update readme and templates

## [0.6.3]

- Released @ 1/2025 (UTC)
- chore: Update dependencies

## [0.6.2]

- Released @ 1/2025 (UTC)
- chore: Upgrade dependencies

## [0.6.1]

- Released @ 1/2025 (UTC)
- chore: Update dependencies

## [0.6.0]

- Released @ 1/2025 (UTC)
- breaking: Clean up and refactor

## [0.5.2]

- Released @ 1/2025 (UTC)
- fix: Annoying bugfix

## [0.5.1]

- Released @ 1/2025 (UTC)
- fix: Fix annoying bug

## [0.5.0]

- Released @ 1/2025 (UTC)
- breaking: Make improvements to generated output

## [0.4.1]

- Released @ 1/2025 (UTC)
- fix: Add missing scripts

## [0.4.0]

- Released @ 1/2025 (UTC)
- breaking: Update templates and set default template

## [0.3.1]

- Released @ 1/2025 (UTC)
- chore: Update dependencies

## [0.3.0]

- Released @ 1/2025 (UTC)
- breaking: Update dependencies

## [0.2.7]

- Released @ 1/2025 (UTC)
- fix: Fix another bug with case types

## [0.2.6]

- Released @ 1/2025 (UTC)
- fix: Fix issue with key types in screen bindings generator

## [0.2.5]

- Released @ 1/2025 (UTC)
- chore: Update default executables

## [0.2.4]

- Released @ 1/2025 (UTC)
- fix: Fix issue with executable

## [0.2.3]

- Released @ 1/2025 (UTC)
- chore: Update dependencies

## [0.2.2]

- Released @ 1/2025 (UTC)
- chore: Update dependencies

## [0.2.1]

- Released @ 1/2025 (UTC)
- chore: Update dependencies

## [0.2.0]

- Released @ 1/2025 (UTC)
- breaking: Update dependencies and docs

## [0.1.3]

- Released @ 1/2025 (UTC)
- fix: Fix dependency issue with analyzer package

## [0.1.2]

- Released @ 1/2025 (UTC)
- chore: Removed ScreenTr from bindings

## [0.1.1]

- Released @ 1/2025 (UTC)
- chore: Update template

## [0.1.0]

- Released @ 1/2025 (UTC)
- Update
- chore: Update templates
- chore: Update dependencies
- Initial release
