import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/tools/parse_date_time.dart';
import '../../../data/entities/reserved_date.dart';
import '../../../data/repositories/repository.dart';

class ReservedDateCubit extends Cubit<List<ReservedDate>> {
  ReservedDateCubit(this._repository) : super([]) {
    loadReservedDates();
  }

  final Repository _repository;

  Future<void> loadReservedDates() async {
    final List<ReservedDate> reservedDates =
        await _repository.loadReservedDates();

    reservedDates.sort((a, b) {
      final aDateTime = parseDateTime(a.date);
      final bDateTime = parseDateTime(b.date);
      return aDateTime.compareTo(bDateTime);
    });

    reservedDates.sort((a, b) {
      return a.field.compareTo(b.field);
    });

    emit(reservedDates);
  }

  Future<void> addReservedDate(ReservedDate reservedDate) async {
    final List<ReservedDate> reservedDatesList = List<ReservedDate>.from(state);
    reservedDatesList.add(reservedDate);
    await _repository.saveReservedDate(reservedDatesList);
    emit(reservedDatesList);
  }

  Future<void> deleteReservedDate(String id) async {
    final List<ReservedDate> reservedDatesList =
        state.where((reservedDate) => reservedDate.id != id).toList();
    await _repository.saveReservedDate(reservedDatesList);
    emit(reservedDatesList);
  }
}
