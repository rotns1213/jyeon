// Web용 photo_manager stub
class AssetEntity {
  final String id;
  AssetEntity({required this.id});
}

class PhotoManager {
  static Future<bool> requestPermissionExtend() async {
    return false;
  }
}
