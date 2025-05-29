part of 'widget.dart';

final class _State extends TAdaptiveHomeScreenState {
  @override
  Widget body(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text('THIS IS THEHOME SCREEN'),
        FilledButton(
          onPressed: () {
            routeManager.go(LoginScreenConfiguration());
          },
          child: const Text('GO TO LOGIN SCREN'),
        ),
      ],
    );
  }
}
