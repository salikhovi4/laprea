import 'package:flutter/material.dart';
import 'package:laprea/feature/home/presentation/main/home_main_widget.dart';
import 'package:laprea/ui_kit/theme/app_style.dart';
import 'package:laprea/ui_kit/ui_kit.dart';

class NewsCardWidget extends StatelessWidget {
  final NewsModel model;

  const NewsCardWidget({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    final styles = AppStyle(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        spacing: 16,
        children: [
          Image.asset(model.imageUrl, width: 120, height: 120, fit: BoxFit.contain),
          Expanded(
            child: SizedBox(
              height: 120,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(model.title, style: styles.textBaseMedium),
                  Gap(4),
                  Text(model.desc, style: styles.textSmMedium, maxLines: 2, overflow: TextOverflow.ellipsis),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(model.time, style: styles.textXsMedium),
                      UiIcon(UiAssets.play24),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
