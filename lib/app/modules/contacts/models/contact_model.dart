import 'package:mobx/mobx.dart';
part 'contact_model.g.dart';

class ContactModel extends _ContactModelBase with _$ContactModel {
  ContactModel({
    int id,
    String name,
    String lastName,
    String postalCode,
    String address,
    String number,
    String neighborhood,
    String city,
    String state,
    String phone,
    String email,
  }) : super(
          id: id,
          name: name,
          lastName: lastName,
          postalCode: postalCode,
          address: address,
          number: number,
          neighborhood: neighborhood,
          city: city,
          state: state,
          phone: phone,
          email: email,
        );

  factory ContactModel.fromJson(Map<String, dynamic> json) {
    return ContactModel(
      id: json['id'],
      name: json['name'],
      lastName: json['last_name'],
      postalCode: json['postal_code'],
      address: json['address'],
      number: json['number'],
      neighborhood: json['neighborhood'],
      city: json['city'],
      state: json['state'],
      phone: json['phone'],
      email: json['email'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': this.id,
        'name': this.name,
        'last_name': this.lastName,
        'postal_code': this.postalCode,
        'address': this.address,
        'number': this.number,
        'neighborhood': this.neighborhood,
        'city': this.city,
        'state': this.state,
        'phone': this.phone,
        'email': this.email,
      };
}

abstract class _ContactModelBase with Store {
  @observable
  int id;

  @observable
  String name;

  @observable
  String lastName;

  @observable
  String postalCode;

  @observable
  String address;

  @observable
  String number;

  @observable
  String neighborhood;

  @observable
  String city;

  @observable
  String state;

  @observable
  String phone;

  @observable
  String email;

  @action
  setId(int value) => this.id = value;

  @action
  setName(String value) => this.name = value;

  @action
  setLastName(String value) => this.lastName = value;

  @action
  setPostalCode(String value) => this.postalCode = value;

  @action
  setAddress(String value) => this.address = value;

  @action
  setNumber(String value) => this.number = value;

  @action
  setNeighborhood(String value) => this.neighborhood = value;

  @action
  setCity(String value) => this.city = value;

  @action
  setState(String value) => this.state = value;

  @action
  setPhone(String value) => this.phone = value;

  @action
  setEmail(String value) => this.email = value;

  _ContactModelBase(
      {this.id,
      this.name,
      this.lastName,
      this.postalCode,
      this.address,
      this.number,
      this.neighborhood,
      this.city,
      this.state,
      this.phone,
      this.email});
}
