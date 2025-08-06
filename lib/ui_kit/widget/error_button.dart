import 'package:flutter/material.dart';
import 'package:laprea/generated/localization/l10n.dart';
import 'package:laprea/ui_kit/ui_kit.dart';

class ErrorButton extends StatelessWidget {
  const ErrorButton({super.key, required this.onPressed, required this.text});

  final void Function() onPressed;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(text ?? S.of(context).error),
            const Gap(12),
            UiButton(
              customBackgroundColor: UiColors.elevatedButtonBackgroundColor1,
              title: S.of(context).repeat,
              onPressed: onPressed,
            ),
          ],
        ),
      ),
    );
  }
}
