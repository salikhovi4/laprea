import 'package:flutter/material.dart';
import 'package:laprea/feature/home/presentation/main/home_main_widget.dart';
import 'package:laprea/ui_kit/theme/app_style.dart';

class FavorWidget extends StatelessWidget {
  final FavorModel model;

  const FavorWidget({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 4,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(model.imageUrl, fit: BoxFit.cover, width: 140, height: 140),
        ),
        Text(model.title, style: AppStyle(context).textSmMedium),
      ],
    );
  }
}
