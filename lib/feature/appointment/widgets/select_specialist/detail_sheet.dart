import 'package:flutter/material.dart';
import 'package:laprea/feature/appointment/presentation/select_specialist_category/select_specialist_category_page.dart';
import 'package:laprea/generated/localization/l10n.dart';
import 'package:laprea/ui_kit/ui_kit.dart';

class DetailSheet extends StatelessWidget {
  const DetailSheet({super.key, required this.data, required this.onSelect});

  final SpecialistData data;
  final void Function() onSelect;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(data.name, style: context.textM3TitleLargeEmphasizeMedium()),
          const Gap(16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                child: Image.asset(
                  data.image,
                  width: 110,
                  height: 110,
                  fit: BoxFit.cover,
                ),
              ),
              const Gap(16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(data.description, style: context.textSmRegular()),
                    const Gap(8),
                    RichText(
                      text: TextSpan(
                        text: S.of(context).work_experience,
                        style: context.textSmRegular().copyWith(
                          color: UiColors.secondary,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: data.experience,
                            style: context.textSmRegular(),
                          ),
                        ],
                      ),
                    ),
                    const Gap(8),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          data.rating,
                          style: context.textSmRegular().copyWith(
                            color: UiColors.green1,
                          ),
                        ),
                        const Gap(2),
                        const UiIcon(UiAssets.ratingStar, height: 14),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Gap(20),
          UiButton(
            title: S.of(context).select,
            size: UiButtonSize.large,
            textStyle: context.textBaseSemiBold().copyWith(
              color: UiColors.selectSheetTextButton,
            ),
            customPadding: EdgeInsets.zero,
            onPressed: () {
              onSelect();
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
