import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:laprea/ui_kit/ui_kit.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarView extends StatefulWidget {
  const CalendarView({
    super.key,
    required this.availableDates,
    required this.onSelectDay,
  });

  final List<DateTime> availableDates;
  final void Function(DateTime) onSelectDay;

  @override
  State<CalendarView> createState() => _CalendarViewState();
}

class _CalendarViewState extends State<CalendarView> {
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
    return Container(
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
              for (final e in widget.availableDates) {
                if (e.day == selected.day && e.month == selected.month) {
                  setState(() {
                    _selectedDate = selected;
                  });
                  return widget.onSelectDay(selected);
                }
              }
            },
            calendarBuilders: CalendarBuilders(
              outsideBuilder: (_, __, ___) {
                return const SizedBox.shrink();
              },
              defaultBuilder: (context, day, focused) {
                for (final e in widget.availableDates) {
                  if (e.day == day.day && e.month == day.month) {
                    return Center(
                      child: Text(
                        day.day.toString(),
                        style: context.textBaseRegular(),
                      ),
                    );
                  }
                }
                return Center(
                  child: Text(
                    day.day.toString(),
                    style: context.textBaseRegular().copyWith(
                      color: UiColors.stoneGray,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
