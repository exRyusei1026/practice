import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'horizontal_reader_provider.freezed.dart';

@freezed
class HorizontalReaderState with _$HorizontalReaderState {
  const factory HorizontalReaderState({
    @Default(0) int currentIndex,
    @Default(true) bool isFullScreen,
  }) = _HorizontalReaderState;
}

final horizontalReaderProvider =
    StateNotifierProvider<HorizontalReaderNotifier, HorizontalReaderState>(
        (ref) => HorizontalReaderNotifier());

class HorizontalReaderNotifier extends StateNotifier<HorizontalReaderState> {
  HorizontalReaderNotifier() : super(const HorizontalReaderState());

  void changeIndex(int index) {
    state = state.copyWith(currentIndex: index);
  }

  void changeFullScreen() {
    state = state.copyWith(isFullScreen: !state.isFullScreen);
  }
}
