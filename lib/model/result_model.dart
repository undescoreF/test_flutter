import 'package:hive/hive.dart';
import 'package:test_app/model/localisation_model.dart';
import 'package:test_app/model/name_model.dart';
import 'package:test_app/model/person_model.dart';
part 'result_model.g.dart';

@HiveType(typeId: 8)
class Results {
  @HiveField(0)
  String? gender;
  @HiveField(1)
  Name? name;
  @HiveField(2)
  Location? location;
  @HiveField(3)
  String? email;
  @HiveField(4)
  Login? login;
  @HiveField(5)
  Dob? dob;
  @HiveField(6)
  Dob? registered;
  @HiveField(7)
  String? phone;
  @HiveField(8)
  String? cell;
  @HiveField(9)
  Id? idp;
  @HiveField(10)
  Picture? picture;
  @HiveField(11)
  String? nat;

  Results(
      {this.gender,
        this.name,
        this.location,
        this.email,
        this.login,
        this.dob,
        this.registered,
        this.phone,
        this.cell,
        this.idp,
        this.picture,
        this.nat});

  Results.fromJson(Map<String, dynamic> json) {
    gender = json['gender'];
    name = json['name'] != null ? new Name.fromJson(json['name']) : null;
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
    email = json['email'];
    login = json['login'] != null ? new Login.fromJson(json['login']) : null;
    dob = json['dob'] != null ? new Dob.fromJson(json['dob']) : null;
    registered = json['registered'] != null
        ? new Dob.fromJson(json['registered'])
        : null;
    phone = json['phone'];
    cell = json['cell'];
    idp = json['id'] != null ? new Id.fromJson(json['id']) : null;
    picture =
    json['picture'] != null ? new Picture.fromJson(json['picture']) : null;
    nat = json['nat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['gender'] = this.gender;
    if (this.name != null) {
      data['name'] = this.name!.toJson();
    }
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    data['email'] = this.email;
    if (this.login != null) {
      data['login'] = this.login!.toJson();
    }
    if (this.dob != null) {
      data['dob'] = this.dob!.toJson();
    }
    if (this.registered != null) {
      data['registered'] = this.registered!.toJson();
    }
    data['phone'] = this.phone;
    data['cell'] = this.cell;
    if (this.idp != null) {
      data['id'] = this.idp!.toJson();
    }
    if (this.picture != null) {
      data['picture'] = this.picture!.toJson();
    }
    data['nat'] = this.nat;
    return data;
  }
}