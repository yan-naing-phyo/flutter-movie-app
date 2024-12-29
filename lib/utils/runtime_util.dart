class RuntimeUtil {
  const RuntimeUtil._();

  // Convert `runtime` in minutes to string as in `1h 30m`.
  static runtimeString(int runtime) {
    final hours = (runtime / 60).toInt();
    final minutes = (runtime % 60).toInt();

    return '${hours}h ${minutes}m';
  }
}
