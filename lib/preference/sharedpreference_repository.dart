import 'package:hive/hive.dart';


class SharedPreferenceRepository {

  static const _preferencesBox = 'real_estate_app';
  final Box<dynamic> _box;
  SharedPreferenceRepository._(this._box);


  static Future<SharedPreferenceRepository> get instance async {
    final box = await Hive.openBox<dynamic>(_preferencesBox);
    return SharedPreferenceRepository._(box);
  }

  T _getValue<T>(dynamic key, {T? defaultValue}) => _box.get(key, defaultValue: defaultValue) as T;

  Future<void> _setValue<T>(dynamic key, T value) => _box.put(key, value);


  // bool getBoolean(String key) => _getValue(key) ?? false;
  // Future<void> setBoolean(String key, bool value) => _setValue(key, value);


  Future<void> setSlide(bool slider) => _setValue('slider', slider);
  bool isSliding() => _getValue('slider') ?? false;



}