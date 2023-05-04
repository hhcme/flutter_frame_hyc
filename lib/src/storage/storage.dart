import 'package:get_storage/get_storage.dart';

/// 缓存中心的帮助方法
class StorageOfHYC {
  /// 这里是保存所有的缓存实例的地方
  /// 如果需要清除所有缓存的话, 直接遍历这里去调用删除方法就可以了
  static Map<String, GetStorage> _allStorage = {};

  /// 创建一个缓存
  static GetStorage createCache({Duration? duration}) {
    final GetStorage getStorage = GetStorage();
    _allStorage[''] = getStorage;
    return getStorage;
  }
  /// 寻找一个缓存
  static Future<GetStorage?> findCache(String name) async {
    return _allStorage[name];
  }

  /// 删除一个缓存
  static void deleteCache() {}

  /// 删除所有缓存
  static Future<void> clearAll() async {
    // allStorage.map((e) => e.remove(key));
  }
}
