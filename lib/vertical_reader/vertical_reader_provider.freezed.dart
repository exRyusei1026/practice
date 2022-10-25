// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'vertical_reader_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$VerticalReaderState {
  bool get isFullScreen => throw _privateConstructorUsedError;
  bool get canShowEffect => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $VerticalReaderStateCopyWith<VerticalReaderState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VerticalReaderStateCopyWith<$Res> {
  factory $VerticalReaderStateCopyWith(
          VerticalReaderState value, $Res Function(VerticalReaderState) then) =
      _$VerticalReaderStateCopyWithImpl<$Res, VerticalReaderState>;
  @useResult
  $Res call({bool isFullScreen, bool canShowEffect});
}

/// @nodoc
class _$VerticalReaderStateCopyWithImpl<$Res, $Val extends VerticalReaderState>
    implements $VerticalReaderStateCopyWith<$Res> {
  _$VerticalReaderStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFullScreen = null,
    Object? canShowEffect = null,
  }) {
    return _then(_value.copyWith(
      isFullScreen: null == isFullScreen
          ? _value.isFullScreen
          : isFullScreen // ignore: cast_nullable_to_non_nullable
              as bool,
      canShowEffect: null == canShowEffect
          ? _value.canShowEffect
          : canShowEffect // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_VerticalReaderStateCopyWith<$Res>
    implements $VerticalReaderStateCopyWith<$Res> {
  factory _$$_VerticalReaderStateCopyWith(_$_VerticalReaderState value,
          $Res Function(_$_VerticalReaderState) then) =
      __$$_VerticalReaderStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isFullScreen, bool canShowEffect});
}

/// @nodoc
class __$$_VerticalReaderStateCopyWithImpl<$Res>
    extends _$VerticalReaderStateCopyWithImpl<$Res, _$_VerticalReaderState>
    implements _$$_VerticalReaderStateCopyWith<$Res> {
  __$$_VerticalReaderStateCopyWithImpl(_$_VerticalReaderState _value,
      $Res Function(_$_VerticalReaderState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFullScreen = null,
    Object? canShowEffect = null,
  }) {
    return _then(_$_VerticalReaderState(
      isFullScreen: null == isFullScreen
          ? _value.isFullScreen
          : isFullScreen // ignore: cast_nullable_to_non_nullable
              as bool,
      canShowEffect: null == canShowEffect
          ? _value.canShowEffect
          : canShowEffect // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_VerticalReaderState implements _VerticalReaderState {
  const _$_VerticalReaderState(
      {this.isFullScreen = false, this.canShowEffect = true});

  @override
  @JsonKey()
  final bool isFullScreen;
  @override
  @JsonKey()
  final bool canShowEffect;

  @override
  String toString() {
    return 'VerticalReaderState(isFullScreen: $isFullScreen, canShowEffect: $canShowEffect)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_VerticalReaderState &&
            (identical(other.isFullScreen, isFullScreen) ||
                other.isFullScreen == isFullScreen) &&
            (identical(other.canShowEffect, canShowEffect) ||
                other.canShowEffect == canShowEffect));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isFullScreen, canShowEffect);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_VerticalReaderStateCopyWith<_$_VerticalReaderState> get copyWith =>
      __$$_VerticalReaderStateCopyWithImpl<_$_VerticalReaderState>(
          this, _$identity);
}

abstract class _VerticalReaderState implements VerticalReaderState {
  const factory _VerticalReaderState(
      {final bool isFullScreen,
      final bool canShowEffect}) = _$_VerticalReaderState;

  @override
  bool get isFullScreen;
  @override
  bool get canShowEffect;
  @override
  @JsonKey(ignore: true)
  _$$_VerticalReaderStateCopyWith<_$_VerticalReaderState> get copyWith =>
      throw _privateConstructorUsedError;
}
