class ReflectMetadataLookup {
  Map<Object, Map<String, Map<String, Object>>> _dict = {};

  void set(Object k1, String k2, String k3, Object value) {
    _dict[k1] ??= {};
    _dict[k1][k2] ??= {};

    _dict[k1][k2][k3] = value;
  }

  bool has(Object k1, String k2, String k3) {
    if (_dict[k1] == null ||
        _dict[k1][k2] == null ||
        _dict[k1][k2][k3] == null) {
      return false;
    }

    return true;
  }

  Object get(Object k1, String k2, String k3) {
    if (_dict[k1] == null ||
        _dict[k1][k2] == null ||
        _dict[k1][k2][k3] == null) {
      return null;
    }

    return _dict[k1][k2][k3];
  }

  Object getKeys(Object k1, String k2) {
    if (_dict[k1] == null || _dict[k1][k2] == null) {
      return null;
    }

    return _dict[k1][k2].keys.toList();
  }

  bool delete(Object k1, String k2, String k3) {
    if (!has(k1, k2, k3)) {
      return false;
    }

    _dict[k1][k2][k3] = null;
    return true;
  }
}
