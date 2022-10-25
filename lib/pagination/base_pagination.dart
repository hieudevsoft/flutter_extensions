// ignore_for_file: public_member_api_docs, sort_constructors_first
class BasePagination<Key, Item> implements Paginator<Key, Item> {
  late Key initialKey;
  late Function(bool)? onLoadUpdated;
  late Future<List<Item>> Function(Key nextKey)? onRequest;
  late Future<Key> Function(List<Item>)? getNextKey;
  late Future Function(Object?, StackTrace)? onError;
  late Future Function(List<Item>, Key)? onSuccess;

  late Key _currentKey;
  late bool _isMakingrequest;
  BasePagination({
    required this.initialKey,
    this.onLoadUpdated,
    this.onRequest,
    this.getNextKey,
    this.onError,
    this.onSuccess,
  }) {
    _currentKey = initialKey;
    _isMakingrequest = false;
  }

  @override
  void loadNextItems() {
    if (_isMakingrequest) return;
    _isMakingrequest = true;
    onLoadUpdated?.call(true);
    onRequest?.call(_currentKey).then((value) async {
      _currentKey = await getNextKey!.call(value);
      _isMakingrequest = false;
      onSuccess?.call(value, _currentKey);
      onLoadUpdated?.call(false);
    }).onError((error, stackTrace) {
      onError?.call(error, stackTrace);
      onLoadUpdated?.call(false);
      _isMakingrequest = false;
    });
  }

  @override
  void reset() {
    _currentKey = initialKey;
  }

  BasePagination<Key, Item> copyWith({
    Key? initialKey,
    Function(bool)? onLoadUpdated,
    Future<List<Item>> Function(Key nextKey)? onRequest,
    Future<Key> Function(List<Item>)? getNextKey,
    Future Function(Object?, StackTrace)? onError,
    Future Function(List<Item>, Key)? onSuccess,
  }) {
    return BasePagination<Key, Item>(
      initialKey: initialKey ?? this.initialKey,
      onLoadUpdated: onLoadUpdated ?? this.onLoadUpdated,
      onRequest: onRequest ?? this.onRequest,
      getNextKey: getNextKey ?? this.getNextKey,
      onError: onError ?? this.onError,
      onSuccess: onSuccess ?? this.onSuccess,
    );
  }
}

abstract class Paginator<Key, Item> {
  void loadNextItems();
  void reset();
}
