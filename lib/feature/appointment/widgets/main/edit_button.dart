import 'package:flutter/material.dart';
import 'package:laprea/ui_kit/ui_kit.dart';

class EditButton extends StatelessWidget {
  const EditButton({super.key, required this.onTap});

  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWellNoSplash(
      onTap: onTap,
      child: Container(
        height: 32,
        width: 40,
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          border: Border.all(color: UiColors.stoneGray),
          borderRadius: const BorderRadius.all(Radius.circular(16)),
        ),
        child: const UiIcon(UiAssets.edit),
      ),
    );
  }
}
