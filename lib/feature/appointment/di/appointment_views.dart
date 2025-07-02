import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laprea/feature/appointment/cubit/appointment_cubit.dart';
import 'package:laprea/feature/appointment/presentation/main/appointment_main_widget.dart';

@RoutePage(name: 'AppointmentRouteRoot')
class AppointmentRoute extends StatefulWidget {
  const AppointmentRoute({super.key});

  @override
  State<AppointmentRoute> createState() => _AppointmentRouteState();
}

class _AppointmentRouteState extends State<AppointmentRoute> {
  final AppointmentCubit _appointmentCubit = AppointmentCubit();

  @override
  void dispose() {
    _appointmentCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => _appointmentCubit,
      child: const AutoRouter(),
    );
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
