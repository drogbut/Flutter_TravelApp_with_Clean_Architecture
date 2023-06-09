extension NullOrExtension<T> on T? {
  R? nullOr<R>(R? Function(T) converter) =>
      // ignore: null_check_on_nullable_type_parameter
      this == null ? null : converter(this!);
}
