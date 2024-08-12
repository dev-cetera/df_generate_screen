```dart
//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// GENERATED - DO NOT MODIFY BY HAND
// See: https://github.com/robmllze/df_generate_screen
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

part of '___SCREEN_FILE___';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

final class ___SCREEN_CLASS___Controller extends T___SCREEN_CLASS___Controller {
  //
  //
  //

  ___SCREEN_CLASS___Controller(super.screen, super.state);

  // TODO: Delete this if you don't need it.
  ___SCREEN_CLASS___Controller.internal(
    ___SCREEN_CLASS___Configuration internalConfiguration,
  ) : super(null, null, internalConfiguration);

  //
  //
  //

  ___Q1___
  ___I1___
  final pCounter = Pod<int>(-1)..bindWith(this);

  //
  //
  //

  void incrementCounter() {
    this.pCounter.update((final value) => value + 1);
  }

  //
  //
  //

  @override
  void initController() {
    this.pCounter.set(0);
    super.initController();
  }
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

// TODO: Delete this if you don't need it.
extension ___SCREEN_CLASS___ControllerExtension on ___SCREEN_CLASS___Controller {
  // Tip: You can break up your controller into multiple files using extensions.
}
```
