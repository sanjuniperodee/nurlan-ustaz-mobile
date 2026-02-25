import 'package:dio/dio.dart';

import 'package:nurlan_ustaz_flutter/core/data/json_api_response_parser.dart';
import 'package:nurlan_ustaz_flutter/core/error/exception.dart';

/// Rethrow ServerException from interceptor if present, else build from response.
Never handleDioError(DioException e) {
  if (e.error is ServerException) {
    throw e.error as ServerException;
  }
  throw ClientServerException(
    message: JsonApiResponseParser.extractMessage(e.response?.data),
  );
}
