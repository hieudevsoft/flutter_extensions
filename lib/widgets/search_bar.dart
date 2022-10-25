import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_extension/logger/logger.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:flutter_keyboard_size/flutter_keyboard_size.dart';
import 'package:styled_widget/styled_widget.dart';

class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({super.key});

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  final _lengOfHistory = 5;

  final List<String> _searchHistory = ['Flutter', 'React native', 'Java', 'Android', 'iOS'];

  List<String> _filterHistory = List.empty(growable: true);

  String? _seletectedItem;

  late final ScrollController _scrollController;

  late final FloatingSearchBarController _floatingSearchbarController;

  @override
  void initState() {
    super.initState();
    _filterHistory.addAll(_searchHistory.reversed);
    _floatingSearchbarController = FloatingSearchBarController();
    _scrollController = ScrollController()
      ..addListener(() {
        if (_scrollController.position.userScrollDirection == ScrollDirection.forward && _floatingSearchbarController.isOpen) {
          //when scroll forward
        } else if (_floatingSearchbarController.isHidden && _scrollController.position.userScrollDirection == ScrollDirection.reverse) {
          //when scroll reverse
        }
      });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _floatingSearchbarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardSizeProvider(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            buildFloatingSearchBar(),
            Consumer<ScreenHeight>(
              builder: (context, res, child) {
                if (!res.isOpen && _floatingSearchbarController.isOpen) {
                  _floatingSearchbarController.close();
                }
                return Visibility(
                  visible: _floatingSearchbarController.isClosed,
                  child: SearchResultsListView(
                    searchTerm: _seletectedItem,
                    scrollController: _scrollController,
                  ),
                ).padding(top: kToolbarHeight);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildFloatingSearchBar() {
    final width = MediaQuery.of(context).size.width;

    return FloatingSearchBar(
        controller: _floatingSearchbarController,
        hint: 'Search...',
        transitionDuration: const Duration(milliseconds: 600),
        transitionCurve: Curves.easeInOut,
        physics: const BouncingScrollPhysics(),
        openAxisAlignment: 0.0,
        axisAlignment: -1,
        width: width / 2,
        openWidth: width,
        debounceDelay: const Duration(milliseconds: 100),
        onQueryChanged: (query) {
          setState(() {
            _filterHistory = _searchHistory.where((element) => element.contains(query)).toList();
          });
        },

        // Specify a custom transition to be used for
        // animating between opened and closed stated.
        transition: CircularFloatingSearchBarTransition(),
        actions: [
          FloatingSearchBarAction(
            showIfClosed: true,
            showIfOpened: false,
            child: CircularButton(
              icon: const Icon(Icons.search_rounded),
              onPressed: () {},
            ),
          ),
          FloatingSearchBarAction(
            showIfClosed: false,
            showIfOpened: true,
            child: CircularButton(
              icon: const Icon(Icons.close_rounded),
              onPressed: () {
                if (_floatingSearchbarController.query.isEmpty && _floatingSearchbarController.isOpen) {
                  _floatingSearchbarController.close();
                } else {
                  _floatingSearchbarController.clear();
                }
              },
            ),
          ),
        ],
        onSubmitted: (query) {
          if (_floatingSearchbarController.isOpen) {
            _onAddHistory(query);
          }
          AppLogger.logI(query);
        },
        clearQueryOnClose: false,
        builder: (context, transition) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Material(
              color: Colors.white,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: _filterHistory.map((element) {
                  return ListTile(
                    onTap: () {
                      _onAddHistory(element);
                    },
                    leading: Icon(Icons.history_rounded, color: Colors.grey.shade300),
                    title: Text(
                      element,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    trailing: CircularButton(
                      onPressed: () {
                        setState(() {
                          _filterHistory.removeWhere((e) => element == e);
                        });
                      },
                      icon: Icon(
                        Icons.close_rounded,
                        color: Colors.grey.shade300,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          );
        });
  }

  void _onAddHistory(String element) {
    _floatingSearchbarController.query = element;
    _floatingSearchbarController.close();
    _searchHistory.add(element);
    _filterHistory.clear();
    if (_searchHistory.length > _lengOfHistory) _searchHistory.removeAt(0);
    _filterHistory.addAll(_searchHistory.reversed);
    setState(() {
      _seletectedItem = element;
    });
  }
}

class SearchResultsListView extends StatelessWidget {
  final String? searchTerm;
  final ScrollController scrollController;
  const SearchResultsListView({super.key, this.searchTerm, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    if (searchTerm == null) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.search,
              size: 64,
            ),
            Text(
              'Start searching',
              style: Theme.of(context).textTheme.headline5,
            )
          ],
        ),
      );
    }

    return ListView.separated(
      itemCount: 50,
      separatorBuilder: (BuildContext context, int index) {
        return Divider();
      },
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text('$searchTerm search result'),
          subtitle: Text(index.toString()),
        );
      },
      controller: scrollController,
    );
  }
}
