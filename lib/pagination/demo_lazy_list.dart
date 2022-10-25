import 'package:flutter/material.dart';
import 'package:flutter_extension/pagination/base_pagination.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import 'demo_state.dart';

class MyAppLazyList extends StatefulWidget {
  const MyAppLazyList({super.key});

  @override
  State<MyAppLazyList> createState() => _MyAppLazyListState();
}

class _MyAppLazyListState extends State<MyAppLazyList> {
  final controller = Get.put(LazyListController());
  late final ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController(keepScrollOffset: true)
      ..addListener(() {
        if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent) {
          final items = controller.state.value;
          if (!items.isLoading && !items.endReached && items.items.isNotEmpty) {
            controller.loadNextItems();
          }
        }
      });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => ListView.separated(
          shrinkWrap: true,
          controller: _scrollController,
          itemCount: controller.state.value.items.length,
          separatorBuilder: (BuildContext context, int index) {
            return const Divider(
              color: Colors.green,
              height: 2,
              thickness: 2,
            );
          },
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  Text(
                    controller.listNumber[index].toString(),
                    textAlign: TextAlign.center,
                  ),
                  if (index == controller.state.value.items.length - 1) controller.state.value.isLoading ? const CircularProgressIndicator() : const SizedBox(),
                ],
              ),
            );
          },
        ));
  }
}

class LazyListController extends GetxController {
  final listNumber = List.generate(100, (index) => index);
  final state = DemoState(isLoading: true, items: []).obs;
  BasePagination<int, int> _paginator = BasePagination(initialKey: 0);

  @override
  void onInit() {
    _paginator = _paginator.copyWith(
      initialKey: state.value.page,
      onLoadUpdated: (isUpdated) {
        state.value = state.value.copyWith(isLoading: isUpdated);
      },
      getNextKey: (items) async {
        return state.value.page + 1;
      },
      onError: (error, stackTrace) async {
        state.value = state.value.copyWith(error: error.toString());
      },
      onRequest: (nextKey) {
        return getItems(nextKey);
      },
      onSuccess: (items, newKey) async {
        final newItems = state.value.items;
        newItems.addAll(items);
        state.value = state.value.copyWith(items: newItems, page: newKey, endReached: items.isEmpty);
      },
    );
    _paginator.loadNextItems();
    super.onInit();
  }

  void loadNextItems() => _paginator.loadNextItems();

  Future<List<int>> getItems(int page, [int pageSize = 20]) async {
    return Future.delayed(const Duration(seconds: 2), () {
      final startingIndex = page * pageSize;
      if (startingIndex + pageSize <= listNumber.length) {
        return listNumber.sublist(startingIndex, startingIndex + pageSize);
      } else {
        return <int>[];
      }
    });
  }
}
