import 'package:flutter/material.dart';

import 'package:df_screen/df_screen.dart';

import 'screens/_access.g.dart';
import 'screens/_index.g.dart';

void main() {
  runApp(const MainWidget());
}

/// Create a route manager to manage the app's navigation.
final routeManager = ScreenRouteManger(
  // Define the condition that determines if the route manager considers
  // the app state as logged in or logged out.
  isLoggedIn: () => true,
  // Define the condition that determines if the route manager considers
  // the app state as verified and also logged in.
  isVerified: () => true,
  // Specify the function responsible for finding screens based on the
  // ModelScreenConfiguration passed when routing.
  findScreen: findScreenFromConfigurationAndAuthService,
  // Pass the GoRouter routes for each screen to the ScreenRouteManger.
  generatedScreenRoutes: generatedScreenRoutes,
  // Specify default screen to show when logged in.
  defaultOnLoginScreenConfiguration: HomeScreenConfiguration(),
  // Specify default screen to show when logged out.
  defaultOnLogoutScreenConfiguration: LoginScreenConfiguration(),
);

class MainWidget extends StatefulWidget {
  const MainWidget({super.key});

  @override
  State<MainWidget> createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      // Pass the router config to the MaterialApp.
      routerConfig: routeManager.router,
      debugShowCheckedModeBanner: false,
      builder: (context, body) {
        // Draw each screen in a Scaffold.
        return Scaffold(body: body);
      },
    );
  }
}
