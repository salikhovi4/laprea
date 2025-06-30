import 'package:flutter/material.dart';
import 'package:laprea/ui_kit/ui_kit.dart';

class UiAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Widget? child;
  final List<Widget> actions;
  final Color? titleColor;
  final bool hasBackButton;
  final double horizontalPaddings;
  final VoidCallback? onBackCallback;
  final Color? iconBgColor;

  const UiAppBar({
    super.key,
    this.title,
    this.child,
    this.actions = const [],
    this.titleColor,
    this.hasBackButton = true,
    this.horizontalPaddings = 4,
    this.onBackCallback,
    this.iconBgColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: horizontalPaddings),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          if (hasBackButton) ...[
            HeaderIcon(context, iconBgColor: iconBgColor).buildBackButton(onPressed: onBackCallback),
          ] else
            const SizedBox(width: 48, height: 48),
          Gap(4),
          Expanded(
            child:
                child ??
                (title != null
                    ? Text(title ?? '', style: AppStyle(context).text2xlMedium.copyWith(color: titleColor))
                    : const SizedBox.shrink()),
          ),
          ...actions,
        ],
      ), //or row/any widget
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(64);
}
