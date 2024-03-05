import 'package:hive/hive.dart';
part'hive_manager.dart';
abstract class HiveConsumer{
  Future<Box<E>> openBox<E>(String boxName);
  Future<void> close();
  Box<E> box<E>(String name);
  Future<int>add<E>(String boxName,dynamic value);
  Future<void>addAll<E>(String boxName,List<E> value);
  List<E>get<E>(String name);
  void registerAdapter<T>(TypeAdapter<T>adapter,{bool internal=false,bool override=false});
}