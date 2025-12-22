import 'package:dartz/dartz.dart';
import '../../../../../core/network/network_exceptions.dart';
import '../../../../../core/utils/logger.dart';
import '../../domain/repositories/batch_repository.dart';
import '../datasources/batch_remote_datasource.dart';
import '../models/batch_model.dart';

class BatchRepositoryImpl implements BatchRepository {
  final BatchRemoteDatasource remoteDatasource;

  BatchRepositoryImpl(this.remoteDatasource);

  @override
  Future<Either<NetworkException, List<BatchModel>>> getBatches() async {
    try {
      final batches = await remoteDatasource.getBatches();
      AppLogger.info('✅ Fetched ${batches.length} batches');
      return Right(batches);
    } on NetworkException catch (e) {
      AppLogger.error('❌ Failed to fetch batches', e);
      return Left(e);
    }
  }

  @override
  Future<Either<NetworkException, BatchModel>> getBatchById(String id) async {
    try {
      final batch = await remoteDatasource.getBatchById(id);
      AppLogger.info('✅ Fetched batch: ${batch.name}');
      return Right(batch);
    } on NetworkException catch (e) {
      AppLogger.error('❌ Failed to fetch batch', e);
      return Left(e);
    }
  }

  @override
  Future<Either<NetworkException, BatchModel>> createBatch(
    CreateBatchRequest request,
  ) async {
    try {
      final batch = await remoteDatasource.createBatch(request);
      AppLogger.info('✅ Created batch: ${batch.name}');
      return Right(batch);
    } on NetworkException catch (e) {
      AppLogger.error('❌ Failed to create batch', e);
      return Left(e);
    }
  }

  @override
  Future<Either<NetworkException, BatchModel>> updateBatch(
    String id,
    UpdateBatchRequest request,
  ) async {
    try {
      final batch = await remoteDatasource.updateBatch(id, request);
      AppLogger.info('✅ Updated batch: ${batch.name}');
      return Right(batch);
    } on NetworkException catch (e) {
      AppLogger.error('❌ Failed to update batch', e);
      return Left(e);
    }
  }

  @override
  Future<Either<NetworkException, void>> deleteBatch(String id) async {
    try {
      await remoteDatasource.deleteBatch(id);
      AppLogger.info('✅ Deleted batch');
      return const Right(null);
    } on NetworkException catch (e) {
      AppLogger.error('❌ Failed to delete batch', e);
      return Left(e);
    }
  }
}
