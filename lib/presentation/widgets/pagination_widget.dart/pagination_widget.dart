import 'package:flutter/material.dart';
import 'package:tsl_flutter_template/core/constants/app_constant.dart';
import 'package:tsl_flutter_template/presentation/theme/base/theme_extension.dart';

class PaginationWidget<Data> extends StatefulWidget {
  const PaginationWidget({
    super.key,
    required this.dataList,
    required this.callNextPage,
    required this.onRefresh,
    required this.itemBuilder,
    this.padding,
    this.prototypeItem,
    this.emptyBuilder,
  });

  final List<Data> dataList;
  final Future<void> Function() callNextPage;
  final Future<void> Function() onRefresh;
  final Widget? Function(BuildContext context, int index) itemBuilder;
  final Widget? prototypeItem;
  final EdgeInsetsGeometry? padding;
  final Widget Function(BuildContext context)? emptyBuilder;

  @override
  State<PaginationWidget<Data>> createState() => _PaginationWidgetState();
}

class _PaginationWidgetState<Data> extends State<PaginationWidget<Data>> {
  ScrollController scrollController = ScrollController();
  late final Future<void> Function() listener;
  bool isNextCalling = false;

  @override
  void initState() {
    listener = scrollListener;
    scrollController.addListener(listener);
    super.initState();
  }

  Future<void> scrollListener() async {
    double position = scrollController.position.pixels;
    double maxScroll = scrollController.position.maxScrollExtent;
    if (position >= 0.8 * maxScroll && !isNextCalling) {
      if (mounted) {
        setState(() => isNextCalling = true);
      }
      await widget.callNextPage();
      if (mounted) {
        setState(() => isNextCalling = false);
      }
    }
  }

  @override
  void dispose() {
    if (scrollController.hasClients) {
      scrollController.removeListener(listener);
      scrollController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: widget.onRefresh,
      color: context.colors.primary,
      child: ListView.builder(
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: (widget.dataList.isEmpty && widget.emptyBuilder != null)
            ? 1
            : widget.dataList.length + (isNextCalling ? 1 : 0),
        controller: scrollController,
        padding: widget.padding,
        itemBuilder: (context, index) {
          if (index == widget.dataList.length) {
            return Center(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppConstant.horizontalGap8,
                  vertical: AppConstant.verticalGap8,
                ),
                child: CircularProgressIndicator.adaptive(),
              ),
            );
          }
          if (widget.dataList.isEmpty && widget.emptyBuilder != null) {
            return widget.emptyBuilder!(context);
          }
          return widget.itemBuilder(context, index);
        },
        prototypeItem: widget.prototypeItem,
      ),
    );
  }
}
