class PaginationList<T> {
  final List<T> items;
  final int limit;
  final int offset;
  final bool hasMore;
  final bool isLoadingMore;

  const PaginationList({
    required this.items,
    required this.limit,
    required this.offset,
    required this.hasMore,
    required this.isLoadingMore,
  });

  factory PaginationList.empty({
    int limit = 10,
  }) {
    return PaginationList<T>(
      items: const [],
      limit: limit,
      offset: 0,
      hasMore: true,
      isLoadingMore: false,
    );
  }

  PaginationList<T> append(List<T> newItems) {
    final updatedItems = [
      ...items,
      ...newItems,
    ];

    return copyWith(
      items: updatedItems,
      offset: updatedItems.length,
      hasMore: newItems.length >= limit,
      isLoadingMore: false,
    );
  }

  PaginationList<T> copyWith({
    List<T>? items,
    int? limit,
    int? offset,
    bool? hasMore,
    bool? isLoadingMore,
  }) {
    return PaginationList<T>(
      items: items ?? this.items,
      limit: limit ?? this.limit,
      offset: offset ?? this.offset,
      hasMore: hasMore ?? this.hasMore,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
    );
  }
}