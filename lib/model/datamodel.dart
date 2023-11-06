class DataModel {
  int? page;
  int? total;
  List<UserData>? users;

  DataModel({this.page, this.total, this.users});

  factory DataModel.fromjson(Map<String, dynamic> json) {
    return DataModel(
        page: json["page"],
        total: json["total"],
        users:
            List<UserData>.from(json["data"].map((e) => UserData.fromjson(e))));
  }
  Map<String, dynamic> tojson() {
    return {
      "page": page,
      "total": total,
      "users": List<dynamic>.from(users!.map((e) => e.toString()))
    };
  }
}

class UserData {
  int? id;
  String? name;
  int? year;

  // ignore: non_constant_identifier_names
  UserData({
    this.id,
    this.name,
    this.year,
  });

  factory UserData.fromjson(Map<String, dynamic> json) {
    return UserData(
      id: json["id"],
      name: json["name"],
      year: json["year"],
    );
  }
  Map<String, dynamic> tojson() {
    return {
      "id": id,
      "name": name,
      "year": year,
    };
  }
}
