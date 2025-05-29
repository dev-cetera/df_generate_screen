part of 'widget.dart';

final class _State extends TAdaptiveLoginScreenState {
  @override
  Widget body(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text('THIS IS THE LOGIN SCREEN'),
        FilledButton(
          onPressed: () {
            routeManager.go(HomeScreenConfiguration());
          },
          child: const Text('GO TO HOME SCREEN'),
        ),
      ],
    );
  }
}
