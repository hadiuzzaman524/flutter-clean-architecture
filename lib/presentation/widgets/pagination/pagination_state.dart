import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_template/core/state_status/base_status.dart';
import 'package:flutter_template/presentation/widgets/pagination/pagination_list.dart';

part 'pagination_state.freezed.dart';

@freezed
sealed class PaginationState<T, P> with _$PaginationState<T, P> {
  const factory PaginationState({
    required PaginationList<T> pagination,
    required P params,
    @Default(BaseStatus.initial()) BaseStatus status,
  }) = _PaginationState;
}
