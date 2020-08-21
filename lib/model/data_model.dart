class Datadurable {
  String id;
  String codeNo;
  String name;
  String brand;
  String machineNumber;
  String status;
  String responsible;
  String position;

  Datadurable(
      {this.id,
      this.codeNo,
      this.name,
      this.brand,
      this.machineNumber,
      this.status,
      this.responsible,
      this.position});

  Datadurable.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    codeNo = json['code_no'];
    name = json['name'];
    brand = json['brand'];
    machineNumber = json['machine_number'];
    status = json['status'];
    responsible = json['responsible'];
    position = json['position'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['code_no'] = this.codeNo;
    data['name'] = this.name;
    data['brand'] = this.brand;
    data['machine_number'] = this.machineNumber;
    data['status'] = this.status;
    data['responsible'] = this.responsible;
    data['position'] = this.position;
    return data;
  }
}
