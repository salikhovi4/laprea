import 'package:flutter/material.dart';

class InkWellNoSplash extends StatelessWidget {
  const InkWellNoSplash({required this.child, super.key, this.onTap});

  final Widget child;

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      focusColor: Colors.transparent,
      splashColor: Colors.transparent,
      splashFactory: NoSplash.splashFactory,
      onTap: onTap,
      child: child,
    );
  }
}
