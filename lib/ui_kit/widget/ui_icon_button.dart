import 'package:flutter/material.dart';
import 'package:laprea/ui_kit/ui_kit.dart';

class UiIconButton extends StatelessWidget {
  final String assetPath;
  final VoidCallback onPressed;

  const UiIconButton({super.key, required this.assetPath, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWellNoSplash(
      onTap: onPressed,
      child: SizedBox(
        width: 48,
        height: 48,
        child: Center(child: UiIcon(assetPath, width: 24, height: 24, color: UiColors.primary)),
      ),
    );
  }
}
