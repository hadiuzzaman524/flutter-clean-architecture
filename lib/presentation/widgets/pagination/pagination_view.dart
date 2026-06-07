import 'package:flutter/material.dart';

class PaginationView extends StatefulWidget {
  const PaginationView({
    super.key,
    required this.childBuilder,
    required this.onFetchMore,
    required this.hasMore,
    required this.isLoadingMore,
    this.threshold = 200,
  });

  final Widget Function(ScrollController controller) childBuilder;

  final Future<void> Function() onFetchMore;
  final bool hasMore;
  final bool isLoadingMore;
  final double threshold;

  @override
  State<PaginationView> createState() => _PaginationViewState();
}

class _PaginationViewState extends State<PaginationView> {
  late final ScrollController _controller = ScrollController();

  bool _isFetching = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onScroll);
  }

  void _onScroll() {
    if (!_controller.hasClients) return;

    final nearBottom =
        _controller.position.pixels >=
        _controller.position.maxScrollExtent - widget.threshold;

    if (nearBottom && widget.hasMore && !widget.isLoadingMore && !_isFetching) {
      _isFetching = true;

      widget.onFetchMore().whenComplete(() {
        _isFetching = false;
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.childBuilder(_controller),
        if (widget.isLoadingMore)
          const Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 24),
              child: Center(child: CircularProgressIndicator.adaptive()),
            ),
          ),
      ],
    );
  }
}
