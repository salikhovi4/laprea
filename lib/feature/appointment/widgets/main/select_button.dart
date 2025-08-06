import 'package:flutter/material.dart';
import 'package:laprea/generated/localization/l10n.dart';
import 'package:laprea/ui_kit/ui_kit.dart';

class SelectButton extends StatelessWidget {
  const SelectButton({super.key, this.onPressed});

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return UiButton(
      title: S.of(context).select,
      size: UiButtonSize.small,
      state: onPressed == null ? UiButtonState.disabled : UiButtonState.enabled,
      customPadding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
      customBackgroundColor: UiColors.elevatedButtonBackgroundColor1,
      textStyle: context.textSmMedium().copyWith(
        color: UiColors.elevatedButtonTextColor1,
      ),
      onPressed: onPressed,
    );
  }
}
