import 'package:hive/hive.dart';
part 'name_model.g.dart';
@HiveType(typeId: 6)
class Name {
  @HiveField(0)
  String? title;
  @HiveField(1)
  String? first;
  @HiveField(2)
  String? last;

  Name({this.title, this.first, this.last});

  Name.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    first = json['first'];
    last = json['last'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['first'] = this.first;
    data['last'] = this.last;
    return data;
  }
}
