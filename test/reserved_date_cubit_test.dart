import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tennis_field_scheduler/data/entities/reserved_date.dart';
import 'package:tennis_field_scheduler/data/repositories/repository.dart';
import 'package:tennis_field_scheduler/domain/presenters/screens/reserved_date_cubit.dart';

class MockRepository extends Mock implements Repository {}

void main() {
  late MockRepository mockRepository;
  late ReservedDateCubit cubit;

  setUp(() {
    mockRepository = MockRepository();
    cubit = ReservedDateCubit(mockRepository);
  });

  tearDown(() {
    cubit.close();
  });

  test('emits [] when created', () {
    expect(cubit.state, []);
  });

  group('loadReservedDates', () {
    blocTest<ReservedDateCubit, List<ReservedDate>>(
      'emits [reservedDates] when loadReservedDates succeeds',
      build: () => cubit,
      act: (cubit) => cubit.loadReservedDates(),
      expect: () => [],
    );
  });

  group('addReservedDate', () {
    final reservedDate = ReservedDate(
      id: 'id',
      field: 'field',
      date: 'date',
      owner: 'owner',
    );

    blocTest<ReservedDateCubit, List<ReservedDate>>(
      'emits [reservedDates] when addReservedDate succeeds',
      build: () => cubit,
      act: (cubit) => cubit.addReservedDate(reservedDate),
      expect: () => [],
    );
  });

  group('deleteReservedDate', () {
    blocTest<ReservedDateCubit, List<ReservedDate>>(
      'emits [reservedDates] when deleteReservedDate succeeds',
      build: () => cubit,
      act: (cubit) => cubit.deleteReservedDate('id'),
      expect: () => [],
    );
  });
}
