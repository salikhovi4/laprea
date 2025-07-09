import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:laprea/feature/favors/presentation/main/favors_main_widget.dart';
import 'package:laprea/feature/favors/widgets/favor/detail_sheet.dart';
import 'package:laprea/ui_kit/ui_kit.dart';

class FavorItem extends StatelessWidget {
  const FavorItem({super.key, required this.item});

  final FavorData item;

  @override
  Widget build(BuildContext context) {
    return InkWellNoSplash(
      onTap: () {
        showModalBottomSheet<void>(
          useRootNavigator: true,
          context: context,
          builder: (BuildContext _) {
            return DetailSheet(
              data: item,
              onSelect: () {
                // context.read<AppointmentCubit>().favorSelected(item);
                context.router.popUntilRoot();
              },
            );
          },
        );
      },
      child: Container(
        height: 80,
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.all(12),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          color: UiColors.card,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              child: Image.asset(item.image, fit: BoxFit.contain),
            ),
            const Gap(16),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(item.name, style: context.textSmRegular()),
                      ),
                      Text(item.duration, style: context.textXsRegular()),
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
            const Gap(8),
            Text(item.price, style: context.textBaseMedium()),
          ],
        ),
      ),
    );
  }
}
