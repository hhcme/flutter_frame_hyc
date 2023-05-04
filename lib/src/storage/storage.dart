

import 'package:get_storage/get_storage.dart';

/// 缓存中心
class StorageOfHYC {

  List<GetStorage> allStorage=[];



  /// 创建一个缓存
  GetStorage createCache({expectTime}){


    return GetStorage();
  }

  /// 创建一个带有过期时间的缓存
  GetStorage createCacheWithExpire({expectTime}){


    return GetStorage();
  }

  /// 删除一个缓存
  void deleteCache(){

  }

  /// 删除所有缓存
  Future<void> clearAll()async {
    // allStorage.map((e) => e.remove(key));
  }

}