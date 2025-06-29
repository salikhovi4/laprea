import 'package:common/common_flutter.dart';
import 'package:flutter/material.dart';
import 'package:laprea/feature/splash/presentation/bloc/splash_cubit.dart';
import 'package:laprea/ui_kit/ui_kit.dart';

class SplashScreenWidget extends StatefulWidget {
  const SplashScreenWidget({super.key});

  @override
  State<SplashScreenWidget> createState() => _SplashScreenWidgetState();
}

class _SplashScreenWidgetState extends StateWithCubit<SplashCubit, SplashScreenWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UiColors.surface,
      body: SafeArea(
        child: Center(child: Image.asset(UiAssets.splashLogo, width: MediaQuery.sizeOf(context).width * (340 / 412))),
      ),
    );
  }
}
