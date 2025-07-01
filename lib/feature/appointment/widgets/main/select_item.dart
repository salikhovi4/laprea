import 'package:flutter/material.dart';
import 'package:laprea/generated/localization/l10n.dart';
import 'package:laprea/ui_kit/theme/app_style.dart';
import 'package:laprea/ui_kit/theme/theme.dart';
import 'package:laprea/ui_kit/widget/gap/gap.dart';
import 'package:laprea/ui_kit/widget/ui_button.dart';

class SelectItem extends StatelessWidget {
  const SelectItem({
    super.key,
    required this.trailText,
    required this.title,
    this.onPressed,
  });

  final String trailText;
  final String title;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 32),
      child: Row(
        children: [
          Text(trailText),
          Gap(8),
          Expanded(child: Text(title)),
          Gap(8),
          UiButton(
            title: S.of(context).select,
            size: UiButtonSize.small,
            state:
                onPressed == null
                    ? UiButtonState.disabled
                    : UiButtonState.enabled,
            customPadding: EdgeInsets.fromLTRB(12, 0, 12, 0),
            customBackgroundColor: UiColors.elevatedButtonBackgroundColor1,
            textStyle: context.textSmMedium().copyWith(
              color: UiColors.elevatedButtonTextColor1,
            ),
            onPressed: onPressed,
          ),
        ],
      ),
    );
  }
}
