// ignore_for_file: public_member_api_docs, sort_constructors_first
class DemoState {
  late final bool isLoading;
  late final List<int> items;
  final String? error;
  final bool endReached;
  final int page;
  DemoState({
    required this.isLoading,
    required this.items,
    this.endReached = false,
    this.page = 0,
    this.error,
  });

  DemoState copyWith({
    bool? isLoading,
    List<int>? items,
    String? error,
    bool? endReached,
    int? page,
  }) {
    return DemoState(
      isLoading: isLoading ?? this.isLoading,
      items: items ?? this.items,
      error: error ?? this.error,
      endReached: endReached ?? this.endReached,
      page: page ?? this.page,
    );
  }
}
