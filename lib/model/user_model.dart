class Userdata {
  String id;
  String name;
  String username;
  String password;
  String status;

  Userdata({this.id, this.name, this.username, this.password, this.status});

  Userdata.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    username = json['username'];
    password = json['password'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['username'] = this.username;
    data['password'] = this.password;
    data['status'] = this.status;
    return data;
  }
}
