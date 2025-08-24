// lib/services/storage_service.dart
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class StorageService extends GetxService {
  final box = GetStorage();

  Future<StorageService> init() async {
    await GetStorage.init();
    return this;
  }

  void write(String key, dynamic value) => box.write(key, value);
  T? read<T>(String key) => box.read<T>(key);
}
