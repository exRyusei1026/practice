import 'package:comic_viwer_practice/entities/comic/comic.dart';
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

final comicProvider = FutureProvider.autoDispose<Comic>((_) async {
  const manga = Comic(
    comicLength: 3,
    imageUrls: [
      'https://www.sample-videos.com/img/Sample-jpg-image-100kb.jpg',
      'https://www.sample-videos.com/img/Sample-jpg-image-100kb.jpg',
      'https://www.sample-videos.com/img/Sample-jpg-image-100kb.jpg',
    ],
    branchUrls: [
      'a_branch.com',
      'b_branch.com',
    ],
    notSelectedUrls: [
      'b_branch.com',
    ],
  );

  return manga;
});

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
