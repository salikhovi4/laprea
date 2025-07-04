import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'select_date_cubit.freezed.dart';
part 'select_date_state.dart';

class SelectDateCubit extends Cubit<SelectDateState> {
  SelectDateCubit() : super(const SelectDateState());

  void fetchDates() {
    emit(
      state.copyWith(
        availableDate: [
          DateTime(DateTime.now().year, DateTime.now().month, 5),
          DateTime(DateTime.now().year, DateTime.now().month, 12),
          DateTime(DateTime.now().year, DateTime.now().month, 20),
          DateTime(DateTime.now().year, DateTime.now().month, 28),
        ],
      ),
    );
  }

  void fetchTime(DateTime date) {
    emit(
      state.copyWith(
        availableTime: [
          DateTime(DateTime.now().year, DateTime.now().month, 5, 11, 40),
          DateTime(DateTime.now().year, DateTime.now().month, 5, 12, 00),
          DateTime(DateTime.now().year, DateTime.now().month, 5, 12, 40),
          DateTime(DateTime.now().year, DateTime.now().month, 12, 16, 00),
          DateTime(DateTime.now().year, DateTime.now().month, 20, 17, 00),
          DateTime(DateTime.now().year, DateTime.now().month, 28, 18, 00),
        ],
      ),
    );
  }

  void selectedTime(DateTime time) => emit(state.copyWith(selectedTime: time));
}
