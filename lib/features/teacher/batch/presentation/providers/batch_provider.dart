import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../core/network/dio_client.dart';
import '../../../../../core/network/network_exceptions.dart';
import '../../../../../core/utils/logger.dart';
import '../../data/datasources/batch_remote_datasource.dart';
import '../../data/repositories/batch_repository_impl.dart';
import '../../data/models/batch_model.dart';
import '../../domain/repositories/batch_repository.dart';

// Datasource Provider
final batchRemoteDatasourceProvider = Provider<BatchRemoteDatasource>((ref) {
  final dio = ref.watch(dioProvider);
  return BatchRemoteDatasourceImpl(dio);
});

// Repository Provider
final batchRepositoryProvider = Provider<BatchRepository>((ref) {
  final remoteDatasource = ref.watch(batchRemoteDatasourceProvider);
  return BatchRepositoryImpl(remoteDatasource);
});

// Batches List Provider
final batchesProvider = FutureProvider<List<BatchModel>>((ref) async {
  final repository = ref.watch(batchRepositoryProvider);
  final result = await repository.getBatches();

  return result.fold(
    (error) => throw NetworkException.getErrorMessage(error),
    (batches) => batches,
  );
});

// Batch Operations Provider
final batchOperationsProvider =
    StateNotifierProvider<BatchOperationsNotifier, AsyncValue<BatchModel?>>(
  (ref) {
    final repository = ref.watch(batchRepositoryProvider);
    return BatchOperationsNotifier(repository, ref);
  },
);

class BatchOperationsNotifier extends StateNotifier<AsyncValue<BatchModel?>> {
  final BatchRepository _repository;
  final Ref _ref;

  BatchOperationsNotifier(this._repository, this._ref)
      : super(const AsyncValue.data(null));

  Future<bool> createBatch(CreateBatchRequest request) async {
    state = const AsyncValue.loading();

    final result = await _repository.createBatch(request);

    return result.fold(
      (error) {
        final message = NetworkException.getErrorMessage(error);
        state = AsyncValue.error(message, StackTrace.current);
        AppLogger.error('Batch creation failed: $message');
        return false;
      },
      (batch) {
        state = AsyncValue.data(batch);
        AppLogger.info('Batch created successfully: ${batch.name}');
        
        // Refresh batches list
        _ref.invalidate(batchesProvider);
        return true;
      },
    );
  }

  Future<bool> updateBatch(String id, UpdateBatchRequest request) async {
    state = const AsyncValue.loading();

    final result = await _repository.updateBatch(id, request);

    return result.fold(
      (error) {
        final message = NetworkException.getErrorMessage(error);
        state = AsyncValue.error(message, StackTrace.current);
        AppLogger.error('Batch update failed: $message');
        return false;
      },
      (batch) {
        state = AsyncValue.data(batch);
        AppLogger.info('Batch updated successfully: ${batch.name}');
        
        // Refresh batches list
        _ref.invalidate(batchesProvider);
        return true;
      },
    );
  }

  Future<bool> deleteBatch(String id) async {
    state = const AsyncValue.loading();

    final result = await _repository.deleteBatch(id);

    return result.fold(
      (error) {
        final message = NetworkException.getErrorMessage(error);
        state = AsyncValue.error(message, StackTrace.current);
        AppLogger.error('Batch deletion failed: $message');
        return false;
      },
      (_) {
        state = const AsyncValue.data(null);
        AppLogger.info('Batch deleted successfully');
        
        // Refresh batches list
        _ref.invalidate(batchesProvider);
        return true;
      },
    );
  }

  void reset() {
    state = const AsyncValue.data(null);
  }
}
