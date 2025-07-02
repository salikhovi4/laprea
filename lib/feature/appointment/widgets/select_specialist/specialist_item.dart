import 'package:flutter/material.dart';
import 'package:laprea/feature/appointment/presentation/select_specialist_category/select_specialist_category_page.dart';
import 'package:laprea/feature/appointment/widgets/select_specialist/detail_sheet.dart';
import 'package:laprea/ui_kit/ui_kit.dart';

class SpecialistItem extends StatelessWidget {
  const SpecialistItem({super.key, required this.item});

  final SpecialistData item;

  @override
  Widget build(BuildContext context) {
    return InkWellNoSplash(
      onTap: () {
        showModalBottomSheet<void>(
          useRootNavigator: true,
          context: context,
          builder: (BuildContext context) {
            return DetailSheet(data: item);
          },
        );
      },
      child: Container(
        height: 80,
        margin: EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          color: UiColors.card,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              child: Image.asset(item.image, fit: BoxFit.contain),
            ),
            Gap(16),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          item.name,
                          style: context.textSmRegular(),
                        ),
                      ),
                      Text(
                        item.rating,
                        style: context.textXsRegular().copyWith(
                          color:
                          UiColors.specialistRatingTextColor,
                        ),
                      ),
                      Gap(2),
                      UiIcon(
                        UiAssets.ratingStar,
                        height: 15,
                      ),
                    ],
                  ),
                  Text(
                    item.description + item.description,
                    style: context.textXsRegular(),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
