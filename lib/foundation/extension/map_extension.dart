extension MapExtension<K, V> on Map<K, V> {
  /// keyで指定した値がTにキャスト可能であればTとして返す
  ///   例) key=idの値がintであればintとして返す、そうでない場合はdefalut値を返す
  ///   map.tryAt<int>('id', 0);
  T? tryAt<T>(K key, T defalutValue) =>
      this[key] is T ? this[key] as T? : defalutValue;

  /// valueがnullでなければ指定したkeyにinsertする
  ///   例) _idが非nullであれば map['id']に登録
  ///   map.tryInsert('id', _id);
  void tryInsert(K key, V value) {
    if (value != null) {
      this[key] = value;
    }
  }

  /// valueがnullでない場合、funcで加工した値をkeyにinsertする
  ///   例) _idが非nullであれば funcで加工した値を map['id']に登録
  ///   map.tryInsertWithTransform('id', _id, func: (int v) => v * 2);
  void tryInsertWithTransform(K key, V value, {V Function(V src)? func}) {
    if (value != null) {
      this[key] = func!(value);
    }
  }
}
