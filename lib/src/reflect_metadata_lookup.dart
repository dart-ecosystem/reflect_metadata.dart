//class ReflectMetadataLookup {
//  Map<Object, Map<String, Map<String, Object>>> _dict = {};
//
//  void set(Object k1, String k2, String k3, Object value) {
//    _dict[k1] ??= {};
//    _dict[k1][k2] ??= {};
//
//    _dict[k1][k2][k3] = value;
//  }
//
//  bool has(Object k1, String k2, String k3) {
//    if (_dict[k1] == null || _dict[k1][k2] == null || _dict[k1][k2][k3] == null) {
//      return false;
//    }
//
//    return true;
//  }
//
//  Object get(Object k1, String k2, String k3) {
//    if (_dict[k1] == null || _dict[k1][k2] == null || _dict[k1][k2][k3] == null) {
//      return null;
//    }
//
//    return _dict[k1][k2][k3];
//  }
//
//  Object getKeys(Object k1, String k2) {
//    if (_dict[k1] == null || _dict[k1][k2] == null) {
//      return null;
//    }
//
//    return _dict[k1][k2].keys.toList();
//  }
//
//  bool delete(Object k1, String k2, String k3) {
//    if (!has(k1, k2, k3)) {
//      return false;
//    }
//
//    _dict[k1][k2][k3] = null;
//    return true;
//  }
//}

class ReflectMetadataLookup {
  Map<int, Object> _dict = {};

  Map<int, Set<String>> _keysDict = {};

  int _getKeyHashCodeFromTwoKey(int k1, int k2) {
    return k1 * 31 + k2;
  }

  int _getKeyHashCodeFromThreeKey(int k1, int k2, int k3) {
    return k1 * 31 * 31 + k2 * 31 + k3;
  }

  void _setKey(int hashCode, String key) {
    _keysDict[hashCode] ??= {};
    _keysDict[hashCode].add(key);
  }

  void _delKey(int hashCode) {
    _keysDict.remove(hashCode);
  }

  void set(Object k1, String k2, String k3, Object value) {
    int keyHashCode = _getKeyHashCodeFromTwoKey(k1.hashCode, k2.hashCode);
    int hashCode = _getKeyHashCodeFromTwoKey(keyHashCode, k3.hashCode);
    _setKey(keyHashCode, k3);
    _dict[hashCode] = value;
  }

  bool has(Object k1, String k2, String k3) {
    int hashCode = _getKeyHashCodeFromThreeKey(k1.hashCode, k2.hashCode, k3.hashCode);

    return _dict.containsKey(hashCode);
  }

  Object get(Object k1, String k2, String k3) {
    int hashCode = _getKeyHashCodeFromThreeKey(k1.hashCode, k2.hashCode, k3.hashCode);

    return _dict[hashCode];
  }

  Object getKeys(Object k1, String k2) {
    int hashCode = _getKeyHashCodeFromTwoKey(k1.hashCode, k2.hashCode);
    return _keysDict[hashCode]?.toList() ?? [];
  }

  bool delete(Object k1, String k2, String k3) {
    if (!has(k1, k2, k3)) {
      return false;
    }
    int keyHashCode = _getKeyHashCodeFromTwoKey(k1.hashCode, k2.hashCode);
    int hashCode = _getKeyHashCodeFromTwoKey(keyHashCode, k3.hashCode);

    _delKey(keyHashCode);
    _dict.remove(hashCode);
    return true;
  }
}
