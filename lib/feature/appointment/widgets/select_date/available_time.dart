import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:laprea/ui_kit/ui_kit.dart';

class AvailableTime extends StatelessWidget {
  const AvailableTime({
    super.key,
    required this.availableTime,
    required this.onSelectTime,
    this.selectedTime,
  });

  final List<DateTime> availableTime;
  final void Function(DateTime) onSelectTime;
  final DateTime? selectedTime;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children:
          availableTime.map((e) {
            return InkWellNoSplash(
              onTap: () {
                onSelectTime(e);
              },
              child: Container(
                width: selectedTime == e ? null : 70,
                padding:
                    selectedTime == e
                        ? const EdgeInsets.fromLTRB(8, 6, 16, 6)
                        : const EdgeInsets.fromLTRB(16, 6, 16, 6),
                decoration: BoxDecoration(
                  color: selectedTime == e ? UiColors.green2 : UiColors.card,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, 1),
                      blurRadius: 2,
                      color: UiColors.shadow1,
                    ),
                  ],
                ),
                child:
                    selectedTime == e
                        ? Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const UiIcon(UiAssets.checked),
                            const Gap(8),
                            Text(
                              DateFormat().add_Hm().format(e),
                              style: context.textSmMedium().copyWith(
                                color: UiColors.green1,
                              ),
                            ),
                          ],
                        )
                        : Text(
                          DateFormat().add_Hm().format(e),
                          style: context.textSmMedium(),
                        ),
              ),
            );
          }).toList(),
    );
  }
}
