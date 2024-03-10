import 'package:hive/hive.dart';
part 'label.g.dart';
@HiveType(typeId: 2)
class Label extends HiveObject{
  @HiveField(0)
  String name;
  CheckType checkType;
  Label({required this.name,this.checkType=CheckType.none});
}

enum CheckType { all, semi, none }