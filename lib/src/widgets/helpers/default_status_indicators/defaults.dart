import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import 'first_page_error_indicator.dart';
import 'first_page_progress_indicator.dart';
import 'new_page_error_indicator.dart';
import 'new_page_progress_indicator.dart';
import 'no_items_found_indicator.dart';

class PagedInfiniteListConfig {
  PagedInfiniteListConfig({
    this.firstPageErrorIndicatorBuilder = _firstPageErrorIndicatorBuilder,
    this.newPageErrorIndicator = _newPageErrorIndicator,
    this.firstPageProgressIndicator = _firstPageProgressIndicator,
    this.newPageProgressIndicator = _newPageProgressIndicator,
    this.noItemsFoundIndicator = _noItemsFoundIndicator,
  });

  final Widget Function(BuildContext context, PagingController controller)
      firstPageErrorIndicatorBuilder;
  final Widget Function(BuildContext context, PagingController controller)
      newPageErrorIndicator;
  final Widget Function(BuildContext context) firstPageProgressIndicator;
  final Widget Function(BuildContext context) newPageProgressIndicator;
  final Widget Function(BuildContext context) noItemsFoundIndicator;

  static PagedInfiniteListConfig defaults = PagedInfiniteListConfig();

  static Widget _firstPageErrorIndicatorBuilder(context, controller) =>
      FirstPageErrorIndicator(onTryAgain: controller.retryLastFailedRequest);

  static Widget _newPageErrorIndicator(context, controller) =>
      NewPageErrorIndicator(onTap: controller.retryLastFailedRequest);

  static Widget _firstPageProgressIndicator(BuildContext context) =>
      const FirstPageProgressIndicator();

  static Widget _newPageProgressIndicator(BuildContext context) =>
      const NewPageProgressIndicator();

  static Widget _noItemsFoundIndicator(context) => NoItemsFoundIndicator();
}
