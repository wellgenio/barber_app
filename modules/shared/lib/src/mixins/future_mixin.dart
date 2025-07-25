import 'package:dio/dio.dart';
import 'package:result_dart/result_dart.dart';

extension FutureMixin<T extends Object> on Future<T> {
  AsyncResult<T> toResult() async {
    try {
      final value = await this;
      return Success(value);
    } on DioException catch (e) {
      return Failure(Exception(e.response?.data.toString() ?? 'Network error'));
    } catch (e) {
      return Failure(Exception('An unexpected error occurred: $e'));
    }
  }
}

extension FutureMixinVoid on Future<void> {
  AsyncResult<Unit> toResult() async {
    try {
      await this;
      return Success(unit);
    } on DioException catch (e) {
      return Failure(Exception(e.response?.data.toString() ?? 'Network error'));
    } catch (e) {
      return Failure(Exception('An unexpected error occurred: $e'));
    }
  }
}
