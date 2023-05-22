import 'package:get_storage/get_storage.dart';

// todo 这里的缓存没有过期时间的功能, 后面有需要再改进吧

/// 缓存中心的帮助方法
class StorageOfHYC {
  /// 这里是保存所有的缓存实例的地方
  /// 如果需要清除所有缓存的话, 直接遍历这里去调用删除方法就可以了
  static final Map<String, GetStorage> _allStorage = {};

  /// 缓存和过期时间
  static final Map<String, Duration> _storageExpire = {};

  /// 创建一个缓存
  /// [name] 缓存实例的名字
  static GetStorage createCache(String name) {
    final GetStorage getStorage = GetStorage();
    _allStorage[name] = getStorage;
    return getStorage;
  }

  // /// 创建一个缓存
  // /// [name] 缓存实例的名字
  // /// [duration] 缓存的过期时间
  // static GetStorage createCacheWithExpire(String name, Duration duration) {
  //   final GetStorage getStorage = GetStorage();
  //   _allStorage[name] = getStorage;
  //   _storageExpire[name]=duration;
  //   return getStorage;
  // }

  /// 寻找一个缓存
  static Future<GetStorage?> findCache(String name) async {
    return _allStorage[name];
  }

  /// 删除一个缓存
  /// 这里的返回值是布尔值, true 为删除成功 , false 为删除失败
  static Future<bool> deleteCache(String name) async {
    final result = await findCache(name);
    if (result == null) {
      return false;
    }
    result.remove(name);
    _allStorage.remove(name);
    return true;
  }

  /// 删除所有缓存
  static Future<void> clearAll() async {
    for (var key in _allStorage.keys) {
      /// 这个方法可以清除所有的字段
      _allStorage[key]!.erase();
    }
    _allStorage.clear();
  }
}
