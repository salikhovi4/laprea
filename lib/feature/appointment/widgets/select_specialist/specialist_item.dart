import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laprea/feature/appointment/presentation/main/cubit/appointment_cubit.dart';
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
          builder: (BuildContext _) {
            return DetailSheet(
              data: item,
              onSelect: () {
                context.read<AppointmentCubit>().specialistSelected(item);
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
                      Text(
                        item.rating,
                        style: context.textXsRegular().copyWith(
                          color: UiColors.green1,
                        ),
                      ),
                      const Gap(2),
                      const UiIcon(UiAssets.ratingStar, height: 15),
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
