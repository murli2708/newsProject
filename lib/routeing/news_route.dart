import 'package:basic_news_app/pages/details/details_page.dart';
import 'package:basic_news_app/pages/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NewsRoute {
  GoRouter get router => _router;
  final GoRouter _router = GoRouter(
    debugLogDiagnostics: true,
    routes: <GoRoute>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) => HomePage(),
      ),
      GoRoute(
          path: '/details',
          name: "details",
          builder: (BuildContext context, GoRouterState state) {
            return DetailsPage();
          }),
    ],
    errorPageBuilder: (context, state) => MaterialPage(
        key: state.pageKey,
        child: const Scaffold(
          body: Center(
            child: Text("Error Page"),
          ),
        )),
  );
}
