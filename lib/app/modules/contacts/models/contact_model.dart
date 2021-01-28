class ContactModel {
  int id;
  String name;
  String lastName;
  String postalCode;
  String address;
  String number;
  String neighborhood;
  String city;
  String state;
  String phone;
  String email;

  ContactModel({
    this.id,
    this.name,
    this.lastName,
    this.postalCode,
    this.address,
    this.number,
    this.neighborhood,
    this.city,
    this.state,
    this.phone,
    this.email,
  });

  ContactModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    lastName = json['lastName'];
    postalCode = json['postalCode'];
    address = json['address'];
    number = json['number'];
    neighborhood = json['neighborhood'];
    city = json['city'];
    state = json['state'];
    phone = json['phone'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['lastName'] = this.lastName;
    data['postalCode'] = this.postalCode;
    data['address'] = this.address;
    data['number'] = this.number;
    data['neighborhood'] = this.neighborhood;
    data['city'] = this.city;
    data['state'] = this.state;
    data['phone'] = this.phone;
    data['email'] = this.email;
    return data;
  }
}
