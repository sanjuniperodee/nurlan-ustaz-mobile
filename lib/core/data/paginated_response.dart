/// Immutable result of a single paginated API request.
/// Datasource returns this; Repository accumulates pages.
class PaginatedResponse<T> {
  const PaginatedResponse({
    required this.items,
    required this.totalPages,
  });

  final List<T> items;
  final int totalPages;
}
