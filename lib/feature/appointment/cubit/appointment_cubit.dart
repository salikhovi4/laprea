import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:laprea/feature/appointment/presentation/select_favor_category/select_favor_category_page.dart';
import 'package:laprea/feature/appointment/presentation/select_specialist_category/select_specialist_category_page.dart';

part 'appointment_state.dart';

part 'appointment_cubit.freezed.dart';

class AppointmentCubit extends Cubit<AppointmentState> {
  AppointmentCubit() : super(const AppointmentState());

  void specialistSelected(SpecialistData data) =>
      emit(state.copyWith(selectedSpecialist: data));

  void clearFavor() => emit(state.copyWith(selectedFavor: null));

  void favorSelected(FavorData data) =>
      emit(state.copyWith(selectedFavor: data));

  void clearSpecialist() => emit(state.copyWith(selectedSpecialist: null));
}
