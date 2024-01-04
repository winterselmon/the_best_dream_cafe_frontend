import 'package:best_dream_cafe_frontend/presentation/pages/start/start_page.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  // final args = settings.arguments as dynamic;

  switch (settings.name) {
    case StartPage.routeName:
      return _FadeRoute(const StartPage(), settings);

    default:
      return _getPageRoute(const StartPage(), settings);
  }
}

PageRoute _getPageRoute(Widget child, RouteSettings settings) {
  return _FadeRoute(child, settings);
}

class _FadeRoute extends PageRouteBuilder {
  final Widget child;
  final RouteSettings routeName;
  _FadeRoute(this.child, this.routeName)
      : super(
          settings: RouteSettings(
              name: routeName.name, arguments: routeName.arguments),
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              child,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
}
