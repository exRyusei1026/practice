import 'package:freezed_annotation/freezed_annotation.dart';

part 'comic.freezed.dart';

@freezed
class Comic with _$Comic {
  const factory Comic({
    @Default(0) int comicLength,
    @Default(<String>[]) List<String> imageUrls,
    @Default(<String>[]) List<String> branchUrls,
    @Default(<String>[]) List<String> notSelectedUrls,
  }) = _Comic;
}
