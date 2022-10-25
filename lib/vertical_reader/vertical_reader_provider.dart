import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'vertical_reader_provider.freezed.dart';

@freezed
class VerticalReaderState with _$VerticalReaderState {
  const factory VerticalReaderState({
    @Default(false) bool isFullScreen,
    @Default(true) bool canShowEffect,
  }) = _VerticalReaderState;
}

final verticalReaderProvider = StateNotifierProvider.family<
        VerticalReaderNotifier, VerticalReaderState, ScrollController>(
    (ref, scrollController) => VerticalReaderNotifier(scrollController));

class VerticalReaderNotifier extends StateNotifier<VerticalReaderState> {
  VerticalReaderNotifier(ScrollController scrollController)
      : super(const VerticalReaderState()) {
    _init(scrollController);
  }

  void _init(ScrollController scrollController) {
    observeScrollController() {
      if (scrollController.offset >= 845) {
        scrollController.jumpTo(844);
        _showEffect(scrollController);
        scrollController.removeListener(observeScrollController);
      }
    }

    scrollController.addListener(observeScrollController);
    scrollController
        .addListener(() => state = state.copyWith(isFullScreen: true));
  }

  void _showEffect(ScrollController scrollController) {}

  void changeFullScreen() {
    state = state.copyWith(isFullScreen: !state.isFullScreen);
  }

  void changeCanShowEffect() {
    state = state.copyWith(canShowEffect: false);
  }
}
