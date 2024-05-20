import 'package:hive/hive.dart';
import 'dart:convert';
part 'label.g.dart';
@HiveType(typeId: 2)
class Label extends HiveObject{
  @HiveField(0)
  String name;
  CheckType checkType;
  Label({required this.name,this.checkType=CheckType.none});
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'checkType': checkType,
    };
  }
  factory Label.fromMap(Map<String, dynamic> map) {
    return Label(
      name: map['name'] as String,
      checkType:CheckType.none,
    );
  }
  static List<Label> listFromJson(String jsonString) {
    Iterable jsonList = json.decode(jsonString);
    return List<Label>.from(jsonList.map((model) => Label.fromMap(model)));
  }

  static String listToJson(List<Label> labelList) {
    List<Map<String, dynamic>> jsonList = labelList.map((label) => label.toMap()).toList();
    return json.encode(jsonList);
  }
}

enum CheckType { all, semi, none }