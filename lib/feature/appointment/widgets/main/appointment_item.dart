import 'package:flutter/material.dart';
import 'package:laprea/ui_kit/widget/gap/gap.dart';

class AppointmentItem extends StatelessWidget {
  const AppointmentItem({
    super.key,
    required this.trailText,
    required this.title,
    this.button,
  });

  final String trailText;
  final String title;
  final Widget? button;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Text(trailText),
          const Gap(8),
          Expanded(child: Text(title)),
          const Gap(8),
          if (button != null) button!,
        ],
      ),
    );
  }
}
