part of 'select_date_cubit.dart';

@freezed
class SelectDateState with _$SelectDateState {
  const SelectDateState({
    this.availableDate = const <DateTime>[],
    this.availableTime = const <DateTime>[],
    this.selectedTime,
  });

  @override
  final List<DateTime> availableDate;
  @override
  final List<DateTime> availableTime;
  @override
  final DateTime? selectedTime;
}
