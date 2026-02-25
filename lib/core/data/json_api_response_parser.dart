import 'package:nurlan_ustaz_flutter/core/data/paginated_response.dart';

/// Parser for JSON:API-style responses (results, meta.pagination).
class JsonApiResponseParser {
  JsonApiResponseParser._();

  /// Parses a paginated response with `results` and `meta.pagination.pages`.
  static PaginatedResponse<T> parsePaginated<T>(
    Map<String, dynamic> data,
    T Function(Map<String, dynamic>) fromJson,
  ) {
    final resultsRaw = data['results'];
    final results = resultsRaw is List
        ? resultsRaw
            .map((e) => fromJson(e as Map<String, dynamic>))
            .toList()
        : <T>[];
    final totalPages =
        (data['meta']?['pagination']?['pages'] as num?)?.toInt() ?? 1;
    return PaginatedResponse<T>(items: results, totalPages: totalPages);
  }

  /// Parses a list from `results` key.
  static List<T> parseList<T>(
    Map<String, dynamic> data,
    T Function(Map<String, dynamic>) fromJson,
  ) {
    final results = data['results'] as List?;
    if (results == null) return [];
    return results.map((e) => fromJson(e as Map<String, dynamic>)).toList();
  }

  /// Extracts error message from response data (e.response.data).
  static String extractMessage(dynamic responseData) {
    if (responseData is Map<String, dynamic>) {
      final msg = responseData['message'];
      if (msg != null) return msg.toString();
    }
    return 'Unknown error';
  }
}
