import 'package:dartz/dartz.dart';
import '../../../../../core/network/network_exceptions.dart';
import '../../data/models/batch_model.dart';

abstract class BatchRepository {
  Future<Either<NetworkException, List<BatchModel>>> getBatches();
  
  Future<Either<NetworkException, BatchModel>> getBatchById(String id);
  
  Future<Either<NetworkException, BatchModel>> createBatch(
    CreateBatchRequest request,
  );
  
  Future<Either<NetworkException, BatchModel>> updateBatch(
    String id,
    UpdateBatchRequest request,
  );
  
  Future<Either<NetworkException, void>> deleteBatch(String id);
}
