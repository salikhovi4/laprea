import 'package:auto_route/auto_route.dart';
import 'package:common/common_flutter.dart';
import 'package:laprea/navigation/router/router.gr.dart';

part 'splash_state.dart';

class SplashCubit extends BaseCubit<SplashState> {
  final StackRouter navigator;

  SplashCubit({required this.navigator}) : super(BaseState()) {
    _init();
  }

  void _init() async {
    await Future.delayed(Duration(seconds: 3));
    navigator.replace(BottomBar());
  }
}
