part of 'appointment_cubit.dart';

@freezed
class AppointmentState with _$AppointmentState {
  const AppointmentState({
    this.selectedFavor,
    this.selectedSpecialist,
    this.selectedDateTime,
  });

  @override
  final SpecialistData? selectedSpecialist;
  @override
  final FavorData? selectedFavor;
  @override
  final DateTime? selectedDateTime;

  String dateTimeFormatted(String? locale) {
    final value = DateFormat('E ', locale).addPattern('d', '0').addPattern('M', '.0').addPattern('y', '.').add_Hm().format(selectedDateTime!);
    return '${value[0].toUpperCase()}${value.substring(1, value.length)}';
  }

  bool enablePayment() =>
      selectedDateTime != null &&
      selectedSpecialist != null &&
      selectedFavor != null;
}
