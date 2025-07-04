import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laprea/feature/appointment/presentation/main/cubit/appointment_cubit.dart';
import 'package:laprea/feature/appointment/presentation/select_date/cubit/select_date_cubit.dart';
import 'package:laprea/feature/appointment/widgets/select_date/available_time.dart';
import 'package:laprea/feature/appointment/widgets/select_date/calendar_view.dart';
import 'package:laprea/generated/localization/l10n.dart';
import 'package:laprea/ui_kit/ui_kit.dart';

@RoutePage()
class SelectDatePage extends StatefulWidget {
  const SelectDatePage({super.key});

  @override
  State<SelectDatePage> createState() => _SelectDatePageState();
}

class _SelectDatePageState extends State<SelectDatePage> {
  final SelectDateCubit _selectDateCubit = SelectDateCubit();

  @override
  void dispose() {
    _selectDateCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (_) => _selectDateCubit..fetchDates(),
        child: BlocBuilder<SelectDateCubit, SelectDateState>(
          builder: (context, state) {
            return Scaffold(
              appBar: UiAppBar(title: S.of(context).select_date_time),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerFloat,
              floatingActionButton: Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                child: SizedBox(
                  height: 56,
                  child: UiButton(
                    title: S.of(context).select,
                    state:
                        state.selectedTime != null
                            ? UiButtonState.enabled
                            : UiButtonState.disabled,
                    textStyle: context.textBaseSemiBold().copyWith(
                      color: UiColors.selectSheetTextButton,
                    ),
                    onPressed:
                        state.selectedTime != null
                            ? () {
                              context.read<AppointmentCubit>().dateTimeSelected(
                                state.selectedTime!,
                              );
                              context.router.popUntilRoot();
                            }
                            : null,
                  ),
                ),
              ),
              body: ListView(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                children: [
                  CalendarView(
                    availableDates: state.availableDate,
                    onSelectDay: (date) {
                      _selectDateCubit.fetchTime(date);
                    },
                  ),
                  const Gap(24),
                  if (state.availableTime.isNotEmpty)
                    AvailableTime(
                      selectedTime: state.selectedTime,
                      availableTime: state.availableTime,
                      onSelectTime: (time) {
                        _selectDateCubit.selectedTime(time);
                      },
                    ),
                  const Gap(80),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
