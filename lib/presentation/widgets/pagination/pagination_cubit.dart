import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/core/error/response_error.dart';
import 'package:flutter_template/core/state_status/base_status.dart';
import 'package:flutter_template/presentation/widgets/pagination/pagination_list.dart';
import 'package:flutter_template/presentation/widgets/pagination/pagination_state.dart';

abstract class PaginationCubit<T, P> extends Cubit<PaginationState<T, P>> {
  PaginationCubit(this.initialParams)
    : super(
        PaginationState<T, P>(
          pagination: PaginationList<T>.empty(),
          params: initialParams,
          status: const BaseStatus.initial(),
        ),
      );

  final P initialParams;

  P get params => state.params;

  bool _isRequestActive = false;

  Future<List<T>> fetchData({required int limit, required int offset});

  Future<void> fetch() => _fetch(isRefresh: false);

  Future<void> refresh() => _fetch(isRefresh: true);

  void setParams(P params, {bool refresh = true}) {
    emit(state.copyWith(params: params));
    if (refresh) this.refresh();
  }

  void patchParams(P Function(P current) updater, {bool refresh = true}) {
    setParams(updater(state.params), refresh: refresh);
  }

  void reset() {
    emit(
      PaginationState<T, P>(
        pagination: PaginationList<T>.empty(),
        params: initialParams,
        status: const BaseStatus.initial(),
      ),
    );
  }

  Future<void> _fetch({required bool isRefresh}) async {
    final pagination = state.pagination;

    if (_isRequestActive) return;

    if (!isRefresh && (pagination.isLoadingMore || !pagination.hasMore)) {
      return;
    }

    _isRequestActive = true;

    final offset = isRefresh ? 0 : pagination.items.length;

    emit(
      state.copyWith(
        status: isRefresh ? const BaseStatus.loading() : state.status,
        pagination: pagination.copyWith(isLoadingMore: !isRefresh),
      ),
    );

    try {
      final result = await fetchData(limit: pagination.limit, offset: offset);

      final updatedItems = isRefresh
          ? result
          : [...pagination.items, ...result];

      emit(
        state.copyWith(
          pagination: pagination.copyWith(
            items: updatedItems,
            offset: updatedItems.length,
            hasMore: result.length >= pagination.limit,
            isLoadingMore: false,
          ),
          status: const BaseStatus.success(),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: BaseStatus.failure(ResponseError.from(e)),
          pagination: pagination.copyWith(isLoadingMore: false),
        ),
      );
    } finally {
      _isRequestActive = false;
    }
  }

  @override
  void emit(PaginationState<T, P> state) {
    if (isClosed) return;
    super.emit(state);
  }
}
