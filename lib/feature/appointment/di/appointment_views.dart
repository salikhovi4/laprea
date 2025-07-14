import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:laprea/feature/appointment/presentation/main/appointment_main_widget.dart';

@RoutePage(name: 'AppointmentRouteRoot')
class AppointmentRoute extends StatelessWidget {
  const AppointmentRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return const AutoRouter();
  }
}

@RoutePage(name: 'AppointmentMainRoute')
class AppointmentMainScreen extends StatelessWidget {
  const AppointmentMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppointmentMainWidget();
  }
}
