import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laprea/feature/appointment/cubit/appointment_cubit.dart';
import 'package:laprea/feature/appointment/widgets/main/appointment_item.dart';
import 'package:laprea/feature/appointment/widgets/main/edit_button.dart';
import 'package:laprea/feature/appointment/widgets/main/select_button.dart';
import 'package:laprea/feature/appointment/widgets/main/selected_item.dart';
import 'package:laprea/generated/localization/l10n.dart';
import 'package:laprea/navigation/router/router.gr.dart';
import 'package:laprea/ui_kit/ui_kit.dart';

class AppointmentMainWidget extends StatelessWidget {
  const AppointmentMainWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: UiAppBar(
          title: S.of(context).appointment,
          hasBackButton: false,
        ),
        body: BlocBuilder<AppointmentCubit, AppointmentState>(
          builder: (context, state) {
            return ListView(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AppointmentItem(
                      trailText: '1.',
                      title: S.of(context).select_favor,
                      button:
                          state.selectedFavor != null
                              ? EditButton(
                                onTap: () {
                                  context.pushRoute(
                                    const SelectFavorCategoryRoute(),
                                  );
                                },
                              )
                              : SelectButton(
                                onPressed: () {
                                  context.pushRoute(
                                    const SelectFavorCategoryRoute(),
                                  );
                                },
                              ),
                    ),
                    if (state.selectedFavor != null)
                      SelectedItem(
                        image: state.selectedFavor!.image,
                        name: state.selectedFavor!.name,
                        info: Text(
                          state.selectedFavor!.duration,
                          style: context.textBaseRegular().copyWith(
                            color: UiColors.hintTextColor,
                          ),
                        ),
                        onPressed: context.read<AppointmentCubit>().clearFavor,
                      )
                    else
                      const Gap(24),
                  ],
                ),
                Column(
                  children: [
                    AppointmentItem(
                      trailText: '2.',
                      title: S.of(context).select_specialist,
                      button:
                          state.selectedSpecialist != null
                              ? EditButton(
                                onTap: () {
                                  context.pushRoute(
                                    const SelectSpecialistCategoryRoute(),
                                  );
                                },
                              )
                              : SelectButton(
                                onPressed: () {
                                  context.pushRoute(
                                    const SelectSpecialistCategoryRoute(),
                                  );
                                },
                              ),
                    ),
                    if (state.selectedSpecialist != null)
                      SelectedItem(
                        image: state.selectedSpecialist!.image,
                        name: state.selectedSpecialist!.name,
                        onPressed:
                            context.read<AppointmentCubit>().clearSpecialist,
                      )
                    else
                      const Gap(24),
                  ],
                ),
                AppointmentItem(
                  trailText: '3.',
                  title: S.of(context).select_date_time,
                  button: SelectButton(
                    onPressed: () {
                      context.pushRoute(const SelectDateRoute());
                    },
                  ),
                ),
                AppointmentItem(
                  trailText: '4.',
                  title: S.of(context).payment_method,
                  button: const SelectButton(),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
