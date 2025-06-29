import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laprea/feature/splash/presentation/bloc/splash_cubit.dart';
import 'package:laprea/feature/splash/presentation/splash_screen_widget.dart';

@RoutePage(name: 'SplashRoute')
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SplashCubit>(
      create: (_) => SplashCubit(navigator: context.router),
      child: const SplashScreenWidget(),
    );
  }
}
