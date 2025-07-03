import 'package:flutter/material.dart';
import 'package:laprea/ui_kit/ui_kit.dart';

class UiIconButton extends StatelessWidget {
  final String assetPath;
  final VoidCallback onPressed;
  final double? size;
  final double iconSize;

  const UiIconButton({
    super.key,
    required this.assetPath,
    required this.onPressed,
    this.size,
    this.iconSize = 24,
  });

  @override
  Widget build(BuildContext context) {
    return InkWellNoSplash(
      onTap: onPressed,
      child: SizedBox(
        width: size ?? 48,
        height: 48,
        child: Center(
          child: UiIcon(
            assetPath,
            width: iconSize,
            height: iconSize,
            color: UiColors.primary,
          ),
        ),
      ),
    );
  }
}
