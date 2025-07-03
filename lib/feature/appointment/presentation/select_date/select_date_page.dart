import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:laprea/generated/localization/l10n.dart';
import 'package:laprea/ui_kit/ui_kit.dart';
import 'package:table_calendar/table_calendar.dart';

class SelectedDateRep {
  List<DateTime> availableDates() {
    return [
      DateTime(DateTime.now().year, DateTime.now().month, 5),
      DateTime(DateTime.now().year, DateTime.now().month, 12),
      DateTime(DateTime.now().year, DateTime.now().month, 20),
      DateTime(DateTime.now().year, DateTime.now().month, 28),
    ];
  }
}

@RoutePage()
class SelectDatePage extends StatefulWidget {
  const SelectDatePage({super.key});

  @override
  State<SelectDatePage> createState() => _SelectDatePageState();
}

class _SelectDatePageState extends State<SelectDatePage> {
  PageController? _controller;

  late var _focusedDate = DateTime.now();
  late var _currentMonth = _dateFormatted(DateTime.now(), context);
  DateTime? _selectedDate;

  String _dateFormatted(DateTime date, BuildContext context) {
    final locale = Localizations.localeOf(context).countryCode;
    final value = DateFormat(locale).add_MMMM().add_y().format(date);
    return '${value[0].toUpperCase()}${value.substring(1, value.length)}';
  }

  @override
  Widget build(BuildContext context) {
    final availableDates = SelectedDateRep().availableDates();
    return SafeArea(
      child: Scaffold(
        appBar: UiAppBar(title: S.of(context).select_date_time),
        body: ListView(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                color: UiColors.card,
                borderRadius: BorderRadius.all(Radius.circular(28)),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      const Gap(16),
                      Text(_currentMonth, style: context.textSmRegular()),
                      const Spacer(),
                      UiIconButton(
                        iconSize: 40,
                        assetPath: UiAssets.arrowLeftCalendar,
                        onPressed: () {
                          _controller?.previousPage(
                            duration: const Duration(milliseconds: 200),
                            curve: Curves.easeIn,
                          );
                        },
                      ),
                      const Gap(4),
                      UiIconButton(
                        iconSize: 40,
                        assetPath: UiAssets.arrowRightCalendar,
                        onPressed: () {
                          _controller?.nextPage(
                            duration: const Duration(milliseconds: 200),
                            curve: Curves.easeIn,
                          );
                        },
                      ),
                    ],
                  ),
                  TableCalendar(
                    locale: Localizations.localeOf(context).countryCode,
                    headerVisible: false,
                    daysOfWeekHeight: 40,
                    daysOfWeekStyle: DaysOfWeekStyle(
                      weekdayStyle: context.textBaseRegular(),
                      weekendStyle: context.textBaseRegular(),
                      dowTextFormatter: (date, locale) {
                        final value = DateFormat(locale).add_E().format(date);
                        return '${value[0].toUpperCase()}${value.substring(1, value.length)}';
                      },
                    ),
                    calendarStyle: CalendarStyle(
                      // outsideTextStyle: const TextStyle(
                      //   color: Colors.transparent,
                      // ),
                      defaultTextStyle: context.textBaseRegular(),
                      weekendTextStyle: context.textBaseRegular(),
                      todayTextStyle: context.textBaseRegular().copyWith(
                        color: UiColors.green1,
                      ),
                      todayDecoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: UiColors.green1),
                      ),
                      selectedDecoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: UiColors.green2,
                      ),
                      selectedTextStyle: context.textBaseRegular().copyWith(
                        color: UiColors.green1,
                      ),
                    ),
                    firstDay: DateTime.utc(2010, 10, 16),
                    lastDay: DateTime.utc(2030, 3, 14),
                    focusedDay: _focusedDate,
                    onPageChanged: (value) {
                      _focusedDate = value;
                      setState(() {
                        _currentMonth = _dateFormatted(value, context);
                      });
                    },
                    onCalendarCreated: (controller) {
                      _controller = controller;
                    },
                    selectedDayPredicate: (date) {
                      return date.day == _selectedDate?.day;
                    },
                    onDaySelected: (selected, focused) {
                      setState(() {
                        _selectedDate = selected;
                      });
                    },
                    // calendarBuilders: CalendarBuilders(
                    //   disabledBuilder: (context, day, focused) {
                    //     return Center(child: Text('2'));
                    //   },
                    // ),
                    // eventLoader: (date) {
                    //   return availableDates;
                    // },
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
