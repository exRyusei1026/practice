import 'package:freezed_annotation/freezed_annotation.dart';

part 'comic.freezed.dart';

@freezed
class Comic with _$Comic {
  const factory Comic({
    @Default('') String imageUrl,
    @Default(0) int comicLength,
  }) = _Comic;
}
