import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:laprea/feature/favors/presentation/main/favors_main_widget.dart';
import 'package:laprea/generated/localization/l10n.dart';

@RoutePage(name: 'FavorsRouteRoot')
class FavorsRoute extends StatelessWidget {
  const FavorsRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return const AutoRouter();
  }
}

@RoutePage(name: 'FavorsMainRoute')
class FavorsMainScreen extends StatelessWidget {
  const FavorsMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FavorsMainWidget(title: S.of(context).favor);
  }
}
