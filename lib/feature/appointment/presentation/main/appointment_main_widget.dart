import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:laprea/feature/appointment/widgets/main/select_item.dart';
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
        body: ListView(
          padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
          children: [
            SelectItem(
              trailText: '1.',
              title: S.of(context).select_favor,
              onPressed: () {
                context.pushRoute(SelectFavorCategoryRoute());
              },
            ),
            SelectItem(
              trailText: '2.',
              title: S.of(context).select_specialist,
              onPressed: () {
                context.pushRoute(SelectSpecialistCategoryRoute());
              },
            ),
            SelectItem(
              trailText: '3.',
              title: S.of(context).select_date_time,
              onPressed: () {},
            ),
            SelectItem(trailText: '4.', title: S.of(context).payment_method),
          ],
        ),
      ),
    );
  }
}
