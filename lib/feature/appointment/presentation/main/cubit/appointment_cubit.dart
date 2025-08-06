import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';
import 'package:laprea/feature/appointment/presentation/select_favor_category/select_favor_category_page.dart';
import 'package:laprea/feature/appointment/presentation/select_specialist_category/select_specialist_category_page.dart';
import 'package:laprea/feature/favors/data/models/service_data.dart';

part 'appointment_state.dart';

part 'appointment_cubit.freezed.dart';

class AppointmentCubit extends Cubit<AppointmentState> {
  AppointmentCubit() : super(const AppointmentState());

  void specialistSelected(SpecialistData data) =>
      emit(state.copyWith(selectedSpecialist: data));

  void clearFavor() => emit(state.copyWith(selectedService: null));

  void favorSelected(ServiceData data) =>
      emit(state.copyWith(selectedService: data));

  void clearSpecialist() => emit(state.copyWith(selectedSpecialist: null));

  void dateTimeSelected(DateTime date) =>
      emit(state.copyWith(selectedDateTime: date));

  void clearDateTime() => emit(state.copyWith(selectedDateTime: null));
}
