import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:laprea/feature/home/presentation/main/home_main_widget.dart';

@RoutePage(name: 'HomeRouteRoot')
class HomeRoute extends StatelessWidget {
  const HomeRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return const AutoRouter();
  }
}

@RoutePage(name: 'HomeMainRoute')
class HomeMainScreen extends StatelessWidget {
  const HomeMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeMainWidget();
  }
}

