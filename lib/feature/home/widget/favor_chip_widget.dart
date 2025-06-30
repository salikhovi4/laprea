import 'package:flutter/material.dart';
import 'package:laprea/ui_kit/theme/app_style.dart';
import 'package:laprea/ui_kit/theme/theme.dart';

class FavorChipWidget extends StatelessWidget {
  final String label;

  const FavorChipWidget({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), border: Border.all(color: UiColors.primary)),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 6, horizontal: 16),
        child: Text(label, style: context.textSmMedium()),
      ),
    );
  }
}
