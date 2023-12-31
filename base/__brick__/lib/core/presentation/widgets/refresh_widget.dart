import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class RefreshWidget extends StatelessWidget {
  final RefreshController? controller;
  final bool enableLoadMore;
  final Function()? onRefresh;
  final Function()? onLoadMore;
  final Widget? child;
  final Widget? footer;

  const RefreshWidget(
      {Key? key,
      this.controller,
      this.enableLoadMore = true,
      this.onRefresh,
      this.onLoadMore,
      this.footer,
      this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      enablePullDown: true,
      enablePullUp: enableLoadMore,
      controller: controller!,
      onRefresh: onRefresh,
      onLoading: onLoadMore,
      header: const MaterialClassicHeader(),
      footer: CustomFooter(
        onClick: onLoadMore,
        builder: (context, mode) {
          if (mode == LoadStatus.loading) {
            return footer!;
          }
          return const SizedBox.shrink();
        },
      ),
      child: child,
    );
  }
}
