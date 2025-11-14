import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../core/network/dio_client.dart';
import '../../../../../core/network/network_exceptions.dart';
import '../../data/datasources/timetable_remote_datasource.dart';
import '../../data/repositories/timetable_repository_impl.dart';
import '../../data/models/timetable_model.dart';
import '../../domain/repositories/timetable_repository.dart';

// Datasource Provider
final timetableRemoteDatasourceProvider =
    Provider<TimetableRemoteDatasource>((ref) {
  final dio = ref.watch(dioProvider);
  return TimetableRemoteDatasourceImpl(dio);
});

// Repository Provider
final timetableRepositoryProvider = Provider<TimetableRepository>((ref) {
  final remoteDatasource = ref.watch(timetableRemoteDatasourceProvider);
  return TimetableRepositoryImpl(remoteDatasource);
});

// Timetable Provider
final timetableProvider = FutureProvider<TimetableModel>((ref) async {
  final repository = ref.watch(timetableRepositoryProvider);
  final result = await repository.getMyTimetable();

  return result.fold(
    (error) => throw NetworkException.getErrorMessage(error),
    (timetable) => timetable,
  );
});
