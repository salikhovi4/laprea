import 'package:common/common_flutter.dart';
import 'package:flutter/material.dart';
import 'package:laprea/feature/profile/presentation/main/bloc/profile_main_cubit.dart';
import 'package:laprea/ui_kit/ui_kit.dart';

class ProfileMainWidget extends StatefulWidget {
  const ProfileMainWidget({super.key});

  @override
  State<ProfileMainWidget> createState() => _ProfileMainWidgetState();
}

class _ProfileMainWidgetState extends StateWithCubit<ProfileMainCubit, ProfileMainWidget> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: context.themeBgColor,
      body: SafeArea(
        child: Column(
          children: [
            UiAppBar(title: 'Профиль', hasBackButton: false),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
              child: Row(
                spacing: 16,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  UiIcon(UiAssets.profileAvatar40, width: 40, height: 40),
                  Expanded(child: Text('Журавлёва Виктория', style: context.textBaseMedium())),
                  UiIconButton(assetPath: UiAssets.notification24, onPressed: () {}),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: UiColors.accentSecondary,
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(image: AssetImage(UiAssets.profileLogo)),
                ),
                child: SizedBox(
                  width: double.infinity,
                  height: 200,
                  child: Stack(
                    children: [
                      Center(child: UiIcon(UiAssets.profileLogo, width: size.width * (250 / 412), height: 94)),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Скидка', style: context.text2xlMediumManrope().copyWith(color: UiColors.accent)),
                                Gap(12),
                                Text('5%', style: context.text2xlMediumManrope().copyWith(color: UiColors.accent)),
                                Spacer(),
                                UiIcon(UiAssets.info24, width: 24, height: 24),
                              ],
                            ),
                            Spacer(),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Бонусы', style: context.textSmMedium().copyWith(color: UiColors.accent)),
                                    Text('157', style: context.textXlSemiBold().copyWith(color: UiColors.accent)),
                                  ],
                                ),
                                Spacer(),
                                UiIcon(UiAssets.qr24, width: 24, height: 24),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
