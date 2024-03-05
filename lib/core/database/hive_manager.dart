part of'hive_consumer.dart';
class HiveManager extends HiveConsumer{
  final HiveInterface _hive;
  HiveManager(this._hive);
  @override
  Future<int> add<E>(String boxName,value)async {
    await openBox<E>(boxName);
    int res= await box<E>(boxName).add(value);
    await close();
    return res;
  }
  @override
  Box<E> box<E>(String name) {
   return _hive.box<E>(name);
  }
  @override
  Future<Box<E>> openBox<E>(String boxName)async{
    return await _hive.openBox<E>(boxName);
  }
  @override
  void registerAdapter<T>(TypeAdapter<T> adapter, {bool internal = false, bool override = false}) {
    _hive.registerAdapter<T>(adapter);
  }
  @override
  List<E> get<E>(String name) {
    return box<E>(name).values.toList();
  }
  @override
  Future<void> close()async {
   await _hive.close();
  }
  @override
  Future<void> addAll<E>(String boxName, List<E> value)async {
    await openBox<E>(boxName);
    await box<E>(boxName).addAll(value);
    await close();
  }
}