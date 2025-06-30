import 'package:flutter/material.dart';
import 'package:laprea/feature/home/presentation/main/home_main_widget.dart';
import 'package:laprea/ui_kit/theme/app_style.dart';
import 'package:laprea/ui_kit/theme/theme.dart';

class AppointmentItemWidget extends StatelessWidget {
  final AppointmentModel model;

  const AppointmentItemWidget({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 320,
      child: DecoratedBox(
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Column(
            spacing: 8,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(model.title, style: context.textBaseBold()),
                      Text(model.time, style: context.textBaseMedium()),
                    ],
                  ),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: UiColors.accent),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                      child: Text(model.status, style: context.textXsMedium().copyWith(color: UiColors.accent)),
                    ),
                  ),
                ],
              ),
              DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: UiColors.surface),
                ),
                child: Padding(
                  padding: EdgeInsets.all(12),
                  child: Row(
                    spacing: 16,
                    children: [
                      SizedBox(width: 46, height: 46, child: Image.asset(model.imageUrl, fit: BoxFit.contain)),
                      Expanded(
                        child: Column(
                          spacing: 2,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(model.desc, style: context.textSmMedium()),
                            Text(model.price, style: context.textBaseMedium()),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
