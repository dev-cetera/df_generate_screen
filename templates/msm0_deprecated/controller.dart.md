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

  // Bind the Pod to this controller so that it disposes  when the controller disposes.
  late final pCounter = Pod<int>(-1)..bindParent(this);

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

  //
  //
  //

  @override
  void dispose() {
    // You can also dispose of Pods manually instead of the bind method
    // illustrated aboce.
    //this.pCounter.dispose();
    super.dispose();
  }
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

// TODO: Delete this if you don't need it.
extension ___SCREEN_CLASS___ControllerExtension on ___SCREEN_CLASS___Controller {
  // Tip: You can break up your controller into multiple files using extensions.
}
```
