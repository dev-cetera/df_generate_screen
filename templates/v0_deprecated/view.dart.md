```dart
//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// GENERATED - DO NOT MODIFY BY HAND
// See: https://github.com/DevCetra/df_generate_screen
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

part of '___SCREEN_FILE___';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

final class _View extends T___SCREEN_CLASS___View {
  //
  //
  //

  @override
  Widget topSide(BuildContext context, double topInsets) {
    return const SizedBox.shrink();
  }

  //
  //
  //

  @override
  Widget body(BuildContext context) {
    return Column(
      children: [
        PodBuilder(
          pod: c.pCounter,
          builder: (context, child, counter) {
            return Text('Count: $counter');
          },
        ),
        TextButton(
          onPressed: c.incrementCounter,
          child: const Text('INCREMENT COUNTER'),
        ),
      ],
    );
  }

  //
  //
  //

  @override
  Widget bottomSide(BuildContext context, double bottomInsets) {
    return const SizedBox.shrink();
  }
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

// TODO: Delete this if you don't need it.
extension _Labels on ___SCREEN_CLASS___Controller {
  // Tip: You can add functions to your controller here.
}
```
