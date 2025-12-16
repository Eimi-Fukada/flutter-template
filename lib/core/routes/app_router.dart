import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_template/shared/widgets/main_navigation.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const MainNavigation();
      },
    ),
  ],
);
