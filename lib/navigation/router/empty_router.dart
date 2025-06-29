import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage(name: 'EmptyRoute')
class EmptyRouter extends StatelessWidget {
  const EmptyRouter({super.key});

  @override
  Widget build(BuildContext context) => const AutoRouter();
}
