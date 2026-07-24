import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_locale_state.freezed.dart';

@freezed
sealed class AppLocaleState with _$AppLocaleState {
  const factory AppLocaleState({
    required List<Locale> supportedLocales,

    /// `null` means "follow the system locale".
    Locale? currentLocale,
  }) = _AppLocaleState;

  factory AppLocaleState.initial(List<Locale> supportedLocales) =>
      AppLocaleState(supportedLocales: supportedLocales);
}
