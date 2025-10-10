import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_template/features/home/presentation/pages/home_page.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const MyHomePage();
      },
    ),
  ],
);
