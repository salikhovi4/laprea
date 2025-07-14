import 'package:flutter/material.dart';
import 'package:laprea/feature/appointment/presentation/select_favor_category/select_favor_category_page.dart';
import 'package:laprea/feature/favors/presentation/main/favors_main_widget.dart';
import 'package:laprea/generated/localization/l10n.dart';
import 'package:laprea/ui_kit/ui_kit.dart';

class DetailSheet extends StatelessWidget {
  const DetailSheet({super.key, required this.data, required this.onSelect});

  final FavorData data;
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
                    RichText(
                      text: TextSpan(
                        text: '${S.of(context).duration}: ',
                        style: context.textSmRegular().copyWith(
                          color: UiColors.secondary,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: data.duration,
                            style: context.textSmRegular(),
                          ),
                        ],
                      ),
                    ),
                    const Gap(8),
                    Text(data.description, style: context.textSmRegular()),
                    const Gap(8),
                    Row(
                      children: [
                        Container(
                          height: 24,
                          padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
                          decoration: const BoxDecoration(
                            color: UiColors.bonusCardColor,
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          ),
                          child: Text(
                            data.bonus,
                            style: context.textM3LabelSmallBold(),
                          ),
                        ),
                        const Spacer(),
                        Text(
                          data.price,
                          style: context.textM3TitleLargeEmphasizeMedium(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Gap(20),
          UiButton(
            title: S.of(context).sign_up_appointment,
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
