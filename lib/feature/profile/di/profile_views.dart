import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:laprea/feature/profile/presentation/main/profile_main_widget.dart';
import 'package:laprea/feature/profile/presentation/visits/visits_widget.dart';

@RoutePage(name: 'ProfileRouteRoot')
class ProfileRoute extends StatelessWidget {
  const ProfileRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return const AutoRouter();
  }
}

@RoutePage(name: 'ProfileMainRoute')
class ProfileMainScreen extends StatelessWidget {
  const ProfileMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ProfileMainWidget();
  }
}

@RoutePage(name: 'ProfileVisitsRoute')
class ProfileVisitsScreen extends StatelessWidget {
  const ProfileVisitsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ProfileVisitsWidget();
  }
}
