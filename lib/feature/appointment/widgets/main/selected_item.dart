import 'package:flutter/material.dart';
import 'package:laprea/ui_kit/ui_kit.dart';

class SelectedItem extends StatelessWidget {
  const SelectedItem({
    super.key,
    this.image,
    required this.text,
    this.info,
    required this.onPressed,
  });

  final String? image;
  final String text;
  final Widget? info;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.fromLTRB(12, 12, 0, 12),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        color: UiColors.card,
      ),
      child: Row(
        children: [
          if (image != null)
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              child: Image.asset(image!, width: 48, height: 48),
            ),
          Gap(image != null ? 12 : 4),
          Expanded(
            child: Text(
              text,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: context.textBaseRegular(),
            ),
          ),
          const Gap(16),
          if (info != null) info!,
          if (info != null) const Gap(8),
          UiIconButton(
            size: 40,
            assetPath: UiAssets.close,
            onPressed: onPressed,
          ),
        ],
      ),
    );
  }
}
