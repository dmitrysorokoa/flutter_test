class DriversModel {
  List<Driver>? drivers;
  String? error;

  DriversModel({this.drivers});

  DriversModel.withError(String errorMessage) {
    error = errorMessage;
  }

  DriversModel.fromJson(List<dynamic> json) {
    drivers = [];
    json.forEach((v) {
      drivers!.add(Driver.fromJson(v));
    });
  }
}

class Driver {
  int? id;
  String? name;
  String? username;
  String? email;

  Driver(
      {this.id,
      this.name,
      this.username,
      this.email});

  Driver.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    username = json['username'];
    email = json['email'];
  }
}