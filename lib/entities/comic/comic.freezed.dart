// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'comic.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Comic {
  int get comicLength => throw _privateConstructorUsedError;
  List<String> get imageUrls => throw _privateConstructorUsedError;
  List<String> get branchUrls => throw _privateConstructorUsedError;
  List<String> get notSelectedUrls => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ComicCopyWith<Comic> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ComicCopyWith<$Res> {
  factory $ComicCopyWith(Comic value, $Res Function(Comic) then) =
      _$ComicCopyWithImpl<$Res, Comic>;
  @useResult
  $Res call(
      {int comicLength,
      List<String> imageUrls,
      List<String> branchUrls,
      List<String> notSelectedUrls});
}

/// @nodoc
class _$ComicCopyWithImpl<$Res, $Val extends Comic>
    implements $ComicCopyWith<$Res> {
  _$ComicCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? comicLength = null,
    Object? imageUrls = null,
    Object? branchUrls = null,
    Object? notSelectedUrls = null,
  }) {
    return _then(_value.copyWith(
      comicLength: null == comicLength
          ? _value.comicLength
          : comicLength // ignore: cast_nullable_to_non_nullable
              as int,
      imageUrls: null == imageUrls
          ? _value.imageUrls
          : imageUrls // ignore: cast_nullable_to_non_nullable
              as List<String>,
      branchUrls: null == branchUrls
          ? _value.branchUrls
          : branchUrls // ignore: cast_nullable_to_non_nullable
              as List<String>,
      notSelectedUrls: null == notSelectedUrls
          ? _value.notSelectedUrls
          : notSelectedUrls // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ComicCopyWith<$Res> implements $ComicCopyWith<$Res> {
  factory _$$_ComicCopyWith(_$_Comic value, $Res Function(_$_Comic) then) =
      __$$_ComicCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int comicLength,
      List<String> imageUrls,
      List<String> branchUrls,
      List<String> notSelectedUrls});
}

/// @nodoc
class __$$_ComicCopyWithImpl<$Res> extends _$ComicCopyWithImpl<$Res, _$_Comic>
    implements _$$_ComicCopyWith<$Res> {
  __$$_ComicCopyWithImpl(_$_Comic _value, $Res Function(_$_Comic) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? comicLength = null,
    Object? imageUrls = null,
    Object? branchUrls = null,
    Object? notSelectedUrls = null,
  }) {
    return _then(_$_Comic(
      comicLength: null == comicLength
          ? _value.comicLength
          : comicLength // ignore: cast_nullable_to_non_nullable
              as int,
      imageUrls: null == imageUrls
          ? _value._imageUrls
          : imageUrls // ignore: cast_nullable_to_non_nullable
              as List<String>,
      branchUrls: null == branchUrls
          ? _value._branchUrls
          : branchUrls // ignore: cast_nullable_to_non_nullable
              as List<String>,
      notSelectedUrls: null == notSelectedUrls
          ? _value._notSelectedUrls
          : notSelectedUrls // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$_Comic implements _Comic {
  const _$_Comic(
      {this.comicLength = 0,
      final List<String> imageUrls = const <String>[],
      final List<String> branchUrls = const <String>[],
      final List<String> notSelectedUrls = const <String>[]})
      : _imageUrls = imageUrls,
        _branchUrls = branchUrls,
        _notSelectedUrls = notSelectedUrls;

  @override
  @JsonKey()
  final int comicLength;
  final List<String> _imageUrls;
  @override
  @JsonKey()
  List<String> get imageUrls {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_imageUrls);
  }

  final List<String> _branchUrls;
  @override
  @JsonKey()
  List<String> get branchUrls {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_branchUrls);
  }

  final List<String> _notSelectedUrls;
  @override
  @JsonKey()
  List<String> get notSelectedUrls {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_notSelectedUrls);
  }

  @override
  String toString() {
    return 'Comic(comicLength: $comicLength, imageUrls: $imageUrls, branchUrls: $branchUrls, notSelectedUrls: $notSelectedUrls)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Comic &&
            (identical(other.comicLength, comicLength) ||
                other.comicLength == comicLength) &&
            const DeepCollectionEquality()
                .equals(other._imageUrls, _imageUrls) &&
            const DeepCollectionEquality()
                .equals(other._branchUrls, _branchUrls) &&
            const DeepCollectionEquality()
                .equals(other._notSelectedUrls, _notSelectedUrls));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      comicLength,
      const DeepCollectionEquality().hash(_imageUrls),
      const DeepCollectionEquality().hash(_branchUrls),
      const DeepCollectionEquality().hash(_notSelectedUrls));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ComicCopyWith<_$_Comic> get copyWith =>
      __$$_ComicCopyWithImpl<_$_Comic>(this, _$identity);
}

abstract class _Comic implements Comic {
  const factory _Comic(
      {final int comicLength,
      final List<String> imageUrls,
      final List<String> branchUrls,
      final List<String> notSelectedUrls}) = _$_Comic;

  @override
  int get comicLength;
  @override
  List<String> get imageUrls;
  @override
  List<String> get branchUrls;
  @override
  List<String> get notSelectedUrls;
  @override
  @JsonKey(ignore: true)
  _$$_ComicCopyWith<_$_Comic> get copyWith =>
      throw _privateConstructorUsedError;
}
