// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'horizontal_reader_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HorizontalReaderState {
  int get currentIndex => throw _privateConstructorUsedError;
  bool get isFullScreen => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HorizontalReaderStateCopyWith<HorizontalReaderState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HorizontalReaderStateCopyWith<$Res> {
  factory $HorizontalReaderStateCopyWith(HorizontalReaderState value,
          $Res Function(HorizontalReaderState) then) =
      _$HorizontalReaderStateCopyWithImpl<$Res, HorizontalReaderState>;
  @useResult
  $Res call({int currentIndex, bool isFullScreen});
}

/// @nodoc
class _$HorizontalReaderStateCopyWithImpl<$Res,
        $Val extends HorizontalReaderState>
    implements $HorizontalReaderStateCopyWith<$Res> {
  _$HorizontalReaderStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentIndex = null,
    Object? isFullScreen = null,
  }) {
    return _then(_value.copyWith(
      currentIndex: null == currentIndex
          ? _value.currentIndex
          : currentIndex // ignore: cast_nullable_to_non_nullable
              as int,
      isFullScreen: null == isFullScreen
          ? _value.isFullScreen
          : isFullScreen // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_HorizontalReaderStateCopyWith<$Res>
    implements $HorizontalReaderStateCopyWith<$Res> {
  factory _$$_HorizontalReaderStateCopyWith(_$_HorizontalReaderState value,
          $Res Function(_$_HorizontalReaderState) then) =
      __$$_HorizontalReaderStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int currentIndex, bool isFullScreen});
}

/// @nodoc
class __$$_HorizontalReaderStateCopyWithImpl<$Res>
    extends _$HorizontalReaderStateCopyWithImpl<$Res, _$_HorizontalReaderState>
    implements _$$_HorizontalReaderStateCopyWith<$Res> {
  __$$_HorizontalReaderStateCopyWithImpl(_$_HorizontalReaderState _value,
      $Res Function(_$_HorizontalReaderState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentIndex = null,
    Object? isFullScreen = null,
  }) {
    return _then(_$_HorizontalReaderState(
      currentIndex: null == currentIndex
          ? _value.currentIndex
          : currentIndex // ignore: cast_nullable_to_non_nullable
              as int,
      isFullScreen: null == isFullScreen
          ? _value.isFullScreen
          : isFullScreen // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_HorizontalReaderState implements _HorizontalReaderState {
  const _$_HorizontalReaderState(
      {this.currentIndex = 0, this.isFullScreen = true});

  @override
  @JsonKey()
  final int currentIndex;
  @override
  @JsonKey()
  final bool isFullScreen;

  @override
  String toString() {
    return 'HorizontalReaderState(currentIndex: $currentIndex, isFullScreen: $isFullScreen)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HorizontalReaderState &&
            (identical(other.currentIndex, currentIndex) ||
                other.currentIndex == currentIndex) &&
            (identical(other.isFullScreen, isFullScreen) ||
                other.isFullScreen == isFullScreen));
  }

  @override
  int get hashCode => Object.hash(runtimeType, currentIndex, isFullScreen);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HorizontalReaderStateCopyWith<_$_HorizontalReaderState> get copyWith =>
      __$$_HorizontalReaderStateCopyWithImpl<_$_HorizontalReaderState>(
          this, _$identity);
}

abstract class _HorizontalReaderState implements HorizontalReaderState {
  const factory _HorizontalReaderState(
      {final int currentIndex,
      final bool isFullScreen}) = _$_HorizontalReaderState;

  @override
  int get currentIndex;
  @override
  bool get isFullScreen;
  @override
  @JsonKey(ignore: true)
  _$$_HorizontalReaderStateCopyWith<_$_HorizontalReaderState> get copyWith =>
      throw _privateConstructorUsedError;
}
