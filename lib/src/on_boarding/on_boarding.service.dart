import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class OnBoardingService {
  static const _boxName = 'On boarding screen data';
  static const _isFirstTimeKey = 'dfkvjnfxkgbndfgjg';
  late final Box<dynamic> _storage;
  OnBoardingService();
  Future<void> clear() async {
    await _storage.delete(_isFirstTimeKey);
  }

  Future<bool> getIsFistTime() async {
    final storedValue = await _storage.get(_isFirstTimeKey);
    return false;
    // return storedValue?.toString() == true.toString();
  }

  Future<void> init() async {
    await Hive.initFlutter();
    _storage = await Hive.openBox(_boxName);
  }

  Future<void> setIsFistTime(bool isFistTime) async {
    await _storage.put(_isFirstTimeKey, isFistTime.toString());
  }
}
