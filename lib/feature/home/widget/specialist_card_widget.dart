import 'package:flutter/material.dart';
import 'package:laprea/feature/home/presentation/main/home_main_widget.dart';
import 'package:laprea/ui_kit/theme/app_style.dart';
import 'package:laprea/ui_kit/ui_kit.dart';

class SpecialistCardWidget extends StatelessWidget {
  final SpecialistModel model;

  const SpecialistCardWidget({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(model.imageUrl, height: 120, fit: BoxFit.contain),
        Gap(4),
        Text(model.name, style: context.textSmMedium()),
        Text(model.major, style: context.textXsMedium().copyWith(color: UiColors.secondary)),
      ],
    );
  }
}
