import 'package:attendease_frontend/core/utils/logger.dart';
import 'package:dio/dio.dart';
import '../../../../../core/network/api_endpoints.dart';
import '../../../../../core/network/network_exceptions.dart';
import '../models/batch_model.dart';

abstract class BatchRemoteDatasource {
  Future<List<BatchModel>> getBatches();
  Future<BatchModel> getBatchById(String id);
  Future<BatchModel> createBatch(CreateBatchRequest request);
  Future<BatchModel> updateBatch(String id, UpdateBatchRequest request);
  Future<void> deleteBatch(String id);
}

class BatchRemoteDatasourceImpl implements BatchRemoteDatasource {
  final Dio dio;

  BatchRemoteDatasourceImpl(this.dio);

  @override
  Future<List<BatchModel>> getBatches() async {
    try {
      final response = await dio.get(ApiEndpoints.batches);

      if (response.data['success'] == true) {
        final List data = response.data['data'] ?? [];
        return data.map((json) => BatchModel.fromJson(json)).toList();
      } else {
        throw const NetworkException.defaultError('Failed to fetch batches');
      }
    } on DioException catch (e) {
      throw NetworkException.getDioException(e);
    }
  }

  @override
  Future<BatchModel> getBatchById(String id) async {
    try {
      final response = await dio.get('${ApiEndpoints.batches}/$id');

      if (response.data['success'] == true) {
        return BatchModel.fromJson(response.data['data']);
      } else {
        throw const NetworkException.defaultError('Failed to fetch batch');
      }
    } on DioException catch (e) {
      throw NetworkException.getDioException(e);
    }
  }

  @override
  Future<BatchModel> createBatch(CreateBatchRequest request) async {
    try {
      AppLogger.info('POST ${ApiEndpoints.batches} payload: ${request.toJson()}');
      final response = await dio.post(
        ApiEndpoints.batches,
        data: request.toJson(),
      );

      if (response.data['success'] == true) {
        return BatchModel.fromJson(response.data['data']);
      } else {
        throw NetworkException.defaultError(
          response.data['message'] ?? 'Failed to create batch',
        );
      }
    } on DioException catch (e) {
      AppLogger.error('Create batch failed - response: ${e.response?.data}', e);
      throw NetworkException.getDioException(e);
    }
  }

  @override
  Future<BatchModel> updateBatch(String id, UpdateBatchRequest request) async {
    try {
      final response = await dio.put(
        '${ApiEndpoints.batches}/$id',
        data: request.toJson(),
      );

      if (response.data['success'] == true) {
        return BatchModel.fromJson(response.data['data']);
      } else {
        throw NetworkException.defaultError(
          response.data['message'] ?? 'Failed to update batch',
        );
      }
    } on DioException catch (e) {
      throw NetworkException.getDioException(e);
    }
  }

  @override
  Future<void> deleteBatch(String id) async {
    try {
      final response = await dio.delete('${ApiEndpoints.batches}/$id');

      if (response.data['success'] != true) {
        throw NetworkException.defaultError(
          response.data['message'] ?? 'Failed to delete batch',
        );
      }
    } on DioException catch (e) {
      throw NetworkException.getDioException(e);
    }
  }
}
