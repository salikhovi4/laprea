part of 'appointment_cubit.dart';

@freezed
class AppointmentState with _$AppointmentState {
  const AppointmentState({this.selectedFavor, this.selectedSpecialist});

  final SpecialistData? selectedSpecialist;
  final FavorData? selectedFavor;
}
