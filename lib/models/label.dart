import 'package:hive/hive.dart';
part 'label.g.dart';
@HiveType(typeId: 2)
class Label extends HiveObject{
  @HiveField(0)
  String name;
  Label({required this.name});
}
