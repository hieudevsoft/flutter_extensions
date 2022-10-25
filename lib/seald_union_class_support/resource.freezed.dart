// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'resource.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Resource<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(dynamic value) idle,
    required TResult Function(dynamic value) loading,
    required TResult Function(T value) success,
    required TResult Function(dynamic value, Object? error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(dynamic value)? idle,
    TResult? Function(dynamic value)? loading,
    TResult? Function(T value)? success,
    TResult? Function(dynamic value, Object? error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(dynamic value)? idle,
    TResult Function(dynamic value)? loading,
    TResult Function(T value)? success,
    TResult Function(dynamic value, Object? error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ResourceIdle<T> value) idle,
    required TResult Function(ResourceLoading<T> value) loading,
    required TResult Function(ResourceSuccess<T> value) success,
    required TResult Function(ResourceError<T> value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ResourceIdle<T> value)? idle,
    TResult? Function(ResourceLoading<T> value)? loading,
    TResult? Function(ResourceSuccess<T> value)? success,
    TResult? Function(ResourceError<T> value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ResourceIdle<T> value)? idle,
    TResult Function(ResourceLoading<T> value)? loading,
    TResult Function(ResourceSuccess<T> value)? success,
    TResult Function(ResourceError<T> value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResourceCopyWith<T, $Res> {
  factory $ResourceCopyWith(
          Resource<T> value, $Res Function(Resource<T>) then) =
      _$ResourceCopyWithImpl<T, $Res, Resource<T>>;
}

/// @nodoc
class _$ResourceCopyWithImpl<T, $Res, $Val extends Resource<T>>
    implements $ResourceCopyWith<T, $Res> {
  _$ResourceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ResourceIdleCopyWith<T, $Res> {
  factory _$$ResourceIdleCopyWith(
          _$ResourceIdle<T> value, $Res Function(_$ResourceIdle<T>) then) =
      __$$ResourceIdleCopyWithImpl<T, $Res>;
  @useResult
  $Res call({dynamic value});
}

/// @nodoc
class __$$ResourceIdleCopyWithImpl<T, $Res>
    extends _$ResourceCopyWithImpl<T, $Res, _$ResourceIdle<T>>
    implements _$$ResourceIdleCopyWith<T, $Res> {
  __$$ResourceIdleCopyWithImpl(
      _$ResourceIdle<T> _value, $Res Function(_$ResourceIdle<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$ResourceIdle<T>(
      value: null == value ? _value.value : value,
    ));
  }
}

/// @nodoc

class _$ResourceIdle<T> implements ResourceIdle<T> {
  const _$ResourceIdle({this.value = null});

  @override
  @JsonKey()
  final dynamic value;

  @override
  String toString() {
    return 'Resource<$T>.idle(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResourceIdle<T> &&
            const DeepCollectionEquality().equals(other.value, value));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(value));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ResourceIdleCopyWith<T, _$ResourceIdle<T>> get copyWith =>
      __$$ResourceIdleCopyWithImpl<T, _$ResourceIdle<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(dynamic value) idle,
    required TResult Function(dynamic value) loading,
    required TResult Function(T value) success,
    required TResult Function(dynamic value, Object? error) error,
  }) {
    return idle(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(dynamic value)? idle,
    TResult? Function(dynamic value)? loading,
    TResult? Function(T value)? success,
    TResult? Function(dynamic value, Object? error)? error,
  }) {
    return idle?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(dynamic value)? idle,
    TResult Function(dynamic value)? loading,
    TResult Function(T value)? success,
    TResult Function(dynamic value, Object? error)? error,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ResourceIdle<T> value) idle,
    required TResult Function(ResourceLoading<T> value) loading,
    required TResult Function(ResourceSuccess<T> value) success,
    required TResult Function(ResourceError<T> value) error,
  }) {
    return idle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ResourceIdle<T> value)? idle,
    TResult? Function(ResourceLoading<T> value)? loading,
    TResult? Function(ResourceSuccess<T> value)? success,
    TResult? Function(ResourceError<T> value)? error,
  }) {
    return idle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ResourceIdle<T> value)? idle,
    TResult Function(ResourceLoading<T> value)? loading,
    TResult Function(ResourceSuccess<T> value)? success,
    TResult Function(ResourceError<T> value)? error,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class ResourceIdle<T> implements Resource<T> {
  const factory ResourceIdle({final dynamic value}) = _$ResourceIdle<T>;

  dynamic get value;
  @JsonKey(ignore: true)
  _$$ResourceIdleCopyWith<T, _$ResourceIdle<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ResourceLoadingCopyWith<T, $Res> {
  factory _$$ResourceLoadingCopyWith(_$ResourceLoading<T> value,
          $Res Function(_$ResourceLoading<T>) then) =
      __$$ResourceLoadingCopyWithImpl<T, $Res>;
  @useResult
  $Res call({dynamic value});
}

/// @nodoc
class __$$ResourceLoadingCopyWithImpl<T, $Res>
    extends _$ResourceCopyWithImpl<T, $Res, _$ResourceLoading<T>>
    implements _$$ResourceLoadingCopyWith<T, $Res> {
  __$$ResourceLoadingCopyWithImpl(
      _$ResourceLoading<T> _value, $Res Function(_$ResourceLoading<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$ResourceLoading<T>(
      value: null == value ? _value.value : value,
    ));
  }
}

/// @nodoc

class _$ResourceLoading<T> implements ResourceLoading<T> {
  const _$ResourceLoading({this.value = null});

  @override
  @JsonKey()
  final dynamic value;

  @override
  String toString() {
    return 'Resource<$T>.loading(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResourceLoading<T> &&
            const DeepCollectionEquality().equals(other.value, value));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(value));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ResourceLoadingCopyWith<T, _$ResourceLoading<T>> get copyWith =>
      __$$ResourceLoadingCopyWithImpl<T, _$ResourceLoading<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(dynamic value) idle,
    required TResult Function(dynamic value) loading,
    required TResult Function(T value) success,
    required TResult Function(dynamic value, Object? error) error,
  }) {
    return loading(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(dynamic value)? idle,
    TResult? Function(dynamic value)? loading,
    TResult? Function(T value)? success,
    TResult? Function(dynamic value, Object? error)? error,
  }) {
    return loading?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(dynamic value)? idle,
    TResult Function(dynamic value)? loading,
    TResult Function(T value)? success,
    TResult Function(dynamic value, Object? error)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ResourceIdle<T> value) idle,
    required TResult Function(ResourceLoading<T> value) loading,
    required TResult Function(ResourceSuccess<T> value) success,
    required TResult Function(ResourceError<T> value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ResourceIdle<T> value)? idle,
    TResult? Function(ResourceLoading<T> value)? loading,
    TResult? Function(ResourceSuccess<T> value)? success,
    TResult? Function(ResourceError<T> value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ResourceIdle<T> value)? idle,
    TResult Function(ResourceLoading<T> value)? loading,
    TResult Function(ResourceSuccess<T> value)? success,
    TResult Function(ResourceError<T> value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class ResourceLoading<T> implements Resource<T> {
  const factory ResourceLoading({final dynamic value}) = _$ResourceLoading<T>;

  dynamic get value;
  @JsonKey(ignore: true)
  _$$ResourceLoadingCopyWith<T, _$ResourceLoading<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ResourceSuccessCopyWith<T, $Res> {
  factory _$$ResourceSuccessCopyWith(_$ResourceSuccess<T> value,
          $Res Function(_$ResourceSuccess<T>) then) =
      __$$ResourceSuccessCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T value});
}

/// @nodoc
class __$$ResourceSuccessCopyWithImpl<T, $Res>
    extends _$ResourceCopyWithImpl<T, $Res, _$ResourceSuccess<T>>
    implements _$$ResourceSuccessCopyWith<T, $Res> {
  __$$ResourceSuccessCopyWithImpl(
      _$ResourceSuccess<T> _value, $Res Function(_$ResourceSuccess<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$ResourceSuccess<T>(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$ResourceSuccess<T> implements ResourceSuccess<T> {
  const _$ResourceSuccess({required this.value});

  @override
  final T value;

  @override
  String toString() {
    return 'Resource<$T>.success(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResourceSuccess<T> &&
            const DeepCollectionEquality().equals(other.value, value));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(value));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ResourceSuccessCopyWith<T, _$ResourceSuccess<T>> get copyWith =>
      __$$ResourceSuccessCopyWithImpl<T, _$ResourceSuccess<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(dynamic value) idle,
    required TResult Function(dynamic value) loading,
    required TResult Function(T value) success,
    required TResult Function(dynamic value, Object? error) error,
  }) {
    return success(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(dynamic value)? idle,
    TResult? Function(dynamic value)? loading,
    TResult? Function(T value)? success,
    TResult? Function(dynamic value, Object? error)? error,
  }) {
    return success?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(dynamic value)? idle,
    TResult Function(dynamic value)? loading,
    TResult Function(T value)? success,
    TResult Function(dynamic value, Object? error)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ResourceIdle<T> value) idle,
    required TResult Function(ResourceLoading<T> value) loading,
    required TResult Function(ResourceSuccess<T> value) success,
    required TResult Function(ResourceError<T> value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ResourceIdle<T> value)? idle,
    TResult? Function(ResourceLoading<T> value)? loading,
    TResult? Function(ResourceSuccess<T> value)? success,
    TResult? Function(ResourceError<T> value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ResourceIdle<T> value)? idle,
    TResult Function(ResourceLoading<T> value)? loading,
    TResult Function(ResourceSuccess<T> value)? success,
    TResult Function(ResourceError<T> value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class ResourceSuccess<T> implements Resource<T> {
  const factory ResourceSuccess({required final T value}) =
      _$ResourceSuccess<T>;

  T get value;
  @JsonKey(ignore: true)
  _$$ResourceSuccessCopyWith<T, _$ResourceSuccess<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ResourceErrorCopyWith<T, $Res> {
  factory _$$ResourceErrorCopyWith(
          _$ResourceError<T> value, $Res Function(_$ResourceError<T>) then) =
      __$$ResourceErrorCopyWithImpl<T, $Res>;
  @useResult
  $Res call({dynamic value, Object? error});
}

/// @nodoc
class __$$ResourceErrorCopyWithImpl<T, $Res>
    extends _$ResourceCopyWithImpl<T, $Res, _$ResourceError<T>>
    implements _$$ResourceErrorCopyWith<T, $Res> {
  __$$ResourceErrorCopyWithImpl(
      _$ResourceError<T> _value, $Res Function(_$ResourceError<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? error = freezed,
  }) {
    return _then(_$ResourceError<T>(
      value: null == value ? _value.value : value,
      error: freezed == error ? _value.error : error,
    ));
  }
}

/// @nodoc

class _$ResourceError<T> implements ResourceError<T> {
  const _$ResourceError({this.value = null, this.error = null});

  @override
  @JsonKey()
  final dynamic value;
  @override
  @JsonKey()
  final Object? error;

  @override
  String toString() {
    return 'Resource<$T>.error(value: $value, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResourceError<T> &&
            const DeepCollectionEquality().equals(other.value, value) &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(value),
      const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ResourceErrorCopyWith<T, _$ResourceError<T>> get copyWith =>
      __$$ResourceErrorCopyWithImpl<T, _$ResourceError<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(dynamic value) idle,
    required TResult Function(dynamic value) loading,
    required TResult Function(T value) success,
    required TResult Function(dynamic value, Object? error) error,
  }) {
    return error(value, this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(dynamic value)? idle,
    TResult? Function(dynamic value)? loading,
    TResult? Function(T value)? success,
    TResult? Function(dynamic value, Object? error)? error,
  }) {
    return error?.call(value, this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(dynamic value)? idle,
    TResult Function(dynamic value)? loading,
    TResult Function(T value)? success,
    TResult Function(dynamic value, Object? error)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(value, this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ResourceIdle<T> value) idle,
    required TResult Function(ResourceLoading<T> value) loading,
    required TResult Function(ResourceSuccess<T> value) success,
    required TResult Function(ResourceError<T> value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ResourceIdle<T> value)? idle,
    TResult? Function(ResourceLoading<T> value)? loading,
    TResult? Function(ResourceSuccess<T> value)? success,
    TResult? Function(ResourceError<T> value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ResourceIdle<T> value)? idle,
    TResult Function(ResourceLoading<T> value)? loading,
    TResult Function(ResourceSuccess<T> value)? success,
    TResult Function(ResourceError<T> value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ResourceError<T> implements Resource<T> {
  const factory ResourceError({final dynamic value, final Object? error}) =
      _$ResourceError<T>;

  dynamic get value;
  Object? get error;
  @JsonKey(ignore: true)
  _$$ResourceErrorCopyWith<T, _$ResourceError<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
