import 'package:hive/hive.dart';
import 'package:test_app/model/result_model.dart';
import 'localisation_model.dart';
import 'name_model.dart';
part 'person_model.g.dart';

@HiveType(typeId: 1)
class Personne {
  @HiveField(0)
  Results? results;

  Personne({this.results});

  Personne.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      json = json["results"];

      results=
          Results(
              gender : json['gender'],
              name : json['name']!=null ? Name.fromJson(json['name']) : null,
              location :json['location']!=null? Location.fromJson(json['location']):null,
              email : json['email'],
              login : json['login']!=null ? Login.fromJson(json['login']) : null,
              dob : json['dob']!=null ? Dob.fromJson(json['dob']): null,
              registered :json['dob']!=null ? Dob.fromJson(json['registered']) : null,
              phone : json['phone'],
              cell : json['cell'],
              idp : json['id']!=null ? Id.fromJson(json['id']):null,
              picture :json['picture']!=null ? Picture.fromJson(json['picture']):null,
              nat : json['nat'],
          );
    }
  }


}





@HiveType(typeId: 2)
class Login {
  @HiveField(0)
  String? uuid;
  @HiveField(1)
  String? username;
  @HiveField(2)
  String? password;
  @HiveField(3)
  String? salt;
  @HiveField(4)
  String? md5;
  @HiveField(5)
  String? sha1;
  @HiveField(6)
  String? sha256;

  Login(
      {this.uuid,
        this.username,
        this.password,
        this.salt,
        this.md5,
        this.sha1,
        this.sha256});

  Login.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    username = json['username'];
    password = json['password'];
    salt = json['salt'];
    md5 = json['md5'];
    sha1 = json['sha1'];
    sha256 = json['sha256'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uuid'] = this.uuid;
    data['username'] = this.username;
    data['password'] = this.password;
    data['salt'] = this.salt;
    data['md5'] = this.md5;
    data['sha1'] = this.sha1;
    data['sha256'] = this.sha256;
    return data;
  }
}
@HiveType(typeId: 3)
class Dob {
  @HiveField(0)
  String? date;
  @HiveField(1)
  int? age;

  Dob({this.date, this.age});

  Dob.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    age = json['age'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['age'] = this.age;
    return data;
  }
}
@HiveType(typeId: 4)
class Id {
  @HiveField(0)
  String? name;
  @HiveField(1)
  String? value;

  Id({this.name, this.value});

  Id.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['value'] = this.value;
    return data;
  }
}
@HiveType(typeId: 5)
class Picture {
  @HiveField(0)
  String? large;
  @HiveField(1)
  String? medium;
  @HiveField(2)
  String? thumbnail;

  Picture({this.large, this.medium, this.thumbnail});

  Picture.fromJson(Map<String, dynamic> json) {
    large = json['large'];
    medium = json['medium'];
    thumbnail = json['thumbnail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['large'] = this.large;
    data['medium'] = this.medium;
    data['thumbnail'] = this.thumbnail;
    return data;
  }
}

