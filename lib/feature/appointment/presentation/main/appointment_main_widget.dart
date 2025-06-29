import 'package:flutter/material.dart';

class AppointmentMainWidget extends StatefulWidget {
  const AppointmentMainWidget({super.key});

  @override
  State<AppointmentMainWidget> createState() => _AppointmentMainWidgetState();
}

class _AppointmentMainWidgetState extends State<AppointmentMainWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: Center(child: Text('Appointment'))));
  }
}
