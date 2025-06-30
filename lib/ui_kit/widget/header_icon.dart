import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:laprea/ui_kit/ui_kit.dart';

class HeaderIcon {
  final BuildContext context;
  final Color? iconBgColor;

  HeaderIcon(this.context, {this.iconBgColor});

  /// Кнопка назад
  Widget buildBackButton({VoidCallback? onPressed}) {
    return UiIconButton(assetPath: UiAssets.arrowLeft24, onPressed: onPressed ?? context.router.maybePop);
  }
}
