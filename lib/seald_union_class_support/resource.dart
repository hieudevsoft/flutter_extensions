import 'package:freezed_annotation/freezed_annotation.dart';

part 'resource.freezed.dart';

@freezed
class Resource<T> with _$Resource {
  const factory Resource.idle({@Default(null) value}) = ResourceIdle;
  const factory Resource.loading({@Default(null) value}) = ResourceLoading;
  const factory Resource.success({required T value}) = ResourceSuccess;
  const factory Resource.error({@Default(null) value, @Default(null) Object? error}) = ResourceError;
}
