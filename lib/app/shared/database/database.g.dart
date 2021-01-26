// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Contact extends DataClass implements Insertable<Contact> {
  final int id;
  final String name;
  final String lastName;
  final String postalCode;
  final String address;
  final String number;
  final String neighborhood;
  final String city;
  final String state;
  final String phone;
  final String email;
  Contact(
      {@required this.id,
      @required this.name,
      this.lastName,
      this.postalCode,
      this.address,
      this.number,
      this.neighborhood,
      this.city,
      this.state,
      this.phone,
      this.email});
  factory Contact.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return Contact(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      lastName: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}last_name']),
      postalCode: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}postal_code']),
      address:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}address']),
      number:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}number']),
      neighborhood: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}neighborhood']),
      city: stringType.mapFromDatabaseResponse(data['${effectivePrefix}city']),
      state:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}state']),
      phone:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}phone']),
      email:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}email']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || lastName != null) {
      map['last_name'] = Variable<String>(lastName);
    }
    if (!nullToAbsent || postalCode != null) {
      map['postal_code'] = Variable<String>(postalCode);
    }
    if (!nullToAbsent || address != null) {
      map['address'] = Variable<String>(address);
    }
    if (!nullToAbsent || number != null) {
      map['number'] = Variable<String>(number);
    }
    if (!nullToAbsent || neighborhood != null) {
      map['neighborhood'] = Variable<String>(neighborhood);
    }
    if (!nullToAbsent || city != null) {
      map['city'] = Variable<String>(city);
    }
    if (!nullToAbsent || state != null) {
      map['state'] = Variable<String>(state);
    }
    if (!nullToAbsent || phone != null) {
      map['phone'] = Variable<String>(phone);
    }
    if (!nullToAbsent || email != null) {
      map['email'] = Variable<String>(email);
    }
    return map;
  }

  ContactsCompanion toCompanion(bool nullToAbsent) {
    return ContactsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      lastName: lastName == null && nullToAbsent
          ? const Value.absent()
          : Value(lastName),
      postalCode: postalCode == null && nullToAbsent
          ? const Value.absent()
          : Value(postalCode),
      address: address == null && nullToAbsent
          ? const Value.absent()
          : Value(address),
      number:
          number == null && nullToAbsent ? const Value.absent() : Value(number),
      neighborhood: neighborhood == null && nullToAbsent
          ? const Value.absent()
          : Value(neighborhood),
      city: city == null && nullToAbsent ? const Value.absent() : Value(city),
      state:
          state == null && nullToAbsent ? const Value.absent() : Value(state),
      phone:
          phone == null && nullToAbsent ? const Value.absent() : Value(phone),
      email:
          email == null && nullToAbsent ? const Value.absent() : Value(email),
    );
  }

  factory Contact.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Contact(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      lastName: serializer.fromJson<String>(json['lastName']),
      postalCode: serializer.fromJson<String>(json['postalCode']),
      address: serializer.fromJson<String>(json['address']),
      number: serializer.fromJson<String>(json['number']),
      neighborhood: serializer.fromJson<String>(json['neighborhood']),
      city: serializer.fromJson<String>(json['city']),
      state: serializer.fromJson<String>(json['state']),
      phone: serializer.fromJson<String>(json['phone']),
      email: serializer.fromJson<String>(json['email']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'lastName': serializer.toJson<String>(lastName),
      'postalCode': serializer.toJson<String>(postalCode),
      'address': serializer.toJson<String>(address),
      'number': serializer.toJson<String>(number),
      'neighborhood': serializer.toJson<String>(neighborhood),
      'city': serializer.toJson<String>(city),
      'state': serializer.toJson<String>(state),
      'phone': serializer.toJson<String>(phone),
      'email': serializer.toJson<String>(email),
    };
  }

  Contact copyWith(
          {int id,
          String name,
          String lastName,
          String postalCode,
          String address,
          String number,
          String neighborhood,
          String city,
          String state,
          String phone,
          String email}) =>
      Contact(
        id: id ?? this.id,
        name: name ?? this.name,
        lastName: lastName ?? this.lastName,
        postalCode: postalCode ?? this.postalCode,
        address: address ?? this.address,
        number: number ?? this.number,
        neighborhood: neighborhood ?? this.neighborhood,
        city: city ?? this.city,
        state: state ?? this.state,
        phone: phone ?? this.phone,
        email: email ?? this.email,
      );
  @override
  String toString() {
    return (StringBuffer('Contact(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('lastName: $lastName, ')
          ..write('postalCode: $postalCode, ')
          ..write('address: $address, ')
          ..write('number: $number, ')
          ..write('neighborhood: $neighborhood, ')
          ..write('city: $city, ')
          ..write('state: $state, ')
          ..write('phone: $phone, ')
          ..write('email: $email')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          name.hashCode,
          $mrjc(
              lastName.hashCode,
              $mrjc(
                  postalCode.hashCode,
                  $mrjc(
                      address.hashCode,
                      $mrjc(
                          number.hashCode,
                          $mrjc(
                              neighborhood.hashCode,
                              $mrjc(
                                  city.hashCode,
                                  $mrjc(
                                      state.hashCode,
                                      $mrjc(phone.hashCode,
                                          email.hashCode)))))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Contact &&
          other.id == this.id &&
          other.name == this.name &&
          other.lastName == this.lastName &&
          other.postalCode == this.postalCode &&
          other.address == this.address &&
          other.number == this.number &&
          other.neighborhood == this.neighborhood &&
          other.city == this.city &&
          other.state == this.state &&
          other.phone == this.phone &&
          other.email == this.email);
}

class ContactsCompanion extends UpdateCompanion<Contact> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> lastName;
  final Value<String> postalCode;
  final Value<String> address;
  final Value<String> number;
  final Value<String> neighborhood;
  final Value<String> city;
  final Value<String> state;
  final Value<String> phone;
  final Value<String> email;
  const ContactsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.lastName = const Value.absent(),
    this.postalCode = const Value.absent(),
    this.address = const Value.absent(),
    this.number = const Value.absent(),
    this.neighborhood = const Value.absent(),
    this.city = const Value.absent(),
    this.state = const Value.absent(),
    this.phone = const Value.absent(),
    this.email = const Value.absent(),
  });
  ContactsCompanion.insert({
    this.id = const Value.absent(),
    @required String name,
    this.lastName = const Value.absent(),
    this.postalCode = const Value.absent(),
    this.address = const Value.absent(),
    this.number = const Value.absent(),
    this.neighborhood = const Value.absent(),
    this.city = const Value.absent(),
    this.state = const Value.absent(),
    this.phone = const Value.absent(),
    this.email = const Value.absent(),
  }) : name = Value(name);
  static Insertable<Contact> custom({
    Expression<int> id,
    Expression<String> name,
    Expression<String> lastName,
    Expression<String> postalCode,
    Expression<String> address,
    Expression<String> number,
    Expression<String> neighborhood,
    Expression<String> city,
    Expression<String> state,
    Expression<String> phone,
    Expression<String> email,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (lastName != null) 'last_name': lastName,
      if (postalCode != null) 'postal_code': postalCode,
      if (address != null) 'address': address,
      if (number != null) 'number': number,
      if (neighborhood != null) 'neighborhood': neighborhood,
      if (city != null) 'city': city,
      if (state != null) 'state': state,
      if (phone != null) 'phone': phone,
      if (email != null) 'email': email,
    });
  }

  ContactsCompanion copyWith(
      {Value<int> id,
      Value<String> name,
      Value<String> lastName,
      Value<String> postalCode,
      Value<String> address,
      Value<String> number,
      Value<String> neighborhood,
      Value<String> city,
      Value<String> state,
      Value<String> phone,
      Value<String> email}) {
    return ContactsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      lastName: lastName ?? this.lastName,
      postalCode: postalCode ?? this.postalCode,
      address: address ?? this.address,
      number: number ?? this.number,
      neighborhood: neighborhood ?? this.neighborhood,
      city: city ?? this.city,
      state: state ?? this.state,
      phone: phone ?? this.phone,
      email: email ?? this.email,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (lastName.present) {
      map['last_name'] = Variable<String>(lastName.value);
    }
    if (postalCode.present) {
      map['postal_code'] = Variable<String>(postalCode.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    if (number.present) {
      map['number'] = Variable<String>(number.value);
    }
    if (neighborhood.present) {
      map['neighborhood'] = Variable<String>(neighborhood.value);
    }
    if (city.present) {
      map['city'] = Variable<String>(city.value);
    }
    if (state.present) {
      map['state'] = Variable<String>(state.value);
    }
    if (phone.present) {
      map['phone'] = Variable<String>(phone.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ContactsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('lastName: $lastName, ')
          ..write('postalCode: $postalCode, ')
          ..write('address: $address, ')
          ..write('number: $number, ')
          ..write('neighborhood: $neighborhood, ')
          ..write('city: $city, ')
          ..write('state: $state, ')
          ..write('phone: $phone, ')
          ..write('email: $email')
          ..write(')'))
        .toString();
  }
}

class $ContactsTable extends Contacts with TableInfo<$ContactsTable, Contact> {
  final GeneratedDatabase _db;
  final String _alias;
  $ContactsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn(
      'name',
      $tableName,
      false,
    );
  }

  final VerificationMeta _lastNameMeta = const VerificationMeta('lastName');
  GeneratedTextColumn _lastName;
  @override
  GeneratedTextColumn get lastName => _lastName ??= _constructLastName();
  GeneratedTextColumn _constructLastName() {
    return GeneratedTextColumn(
      'last_name',
      $tableName,
      true,
    );
  }

  final VerificationMeta _postalCodeMeta = const VerificationMeta('postalCode');
  GeneratedTextColumn _postalCode;
  @override
  GeneratedTextColumn get postalCode => _postalCode ??= _constructPostalCode();
  GeneratedTextColumn _constructPostalCode() {
    return GeneratedTextColumn(
      'postal_code',
      $tableName,
      true,
    );
  }

  final VerificationMeta _addressMeta = const VerificationMeta('address');
  GeneratedTextColumn _address;
  @override
  GeneratedTextColumn get address => _address ??= _constructAddress();
  GeneratedTextColumn _constructAddress() {
    return GeneratedTextColumn(
      'address',
      $tableName,
      true,
    );
  }

  final VerificationMeta _numberMeta = const VerificationMeta('number');
  GeneratedTextColumn _number;
  @override
  GeneratedTextColumn get number => _number ??= _constructNumber();
  GeneratedTextColumn _constructNumber() {
    return GeneratedTextColumn(
      'number',
      $tableName,
      true,
    );
  }

  final VerificationMeta _neighborhoodMeta =
      const VerificationMeta('neighborhood');
  GeneratedTextColumn _neighborhood;
  @override
  GeneratedTextColumn get neighborhood =>
      _neighborhood ??= _constructNeighborhood();
  GeneratedTextColumn _constructNeighborhood() {
    return GeneratedTextColumn(
      'neighborhood',
      $tableName,
      true,
    );
  }

  final VerificationMeta _cityMeta = const VerificationMeta('city');
  GeneratedTextColumn _city;
  @override
  GeneratedTextColumn get city => _city ??= _constructCity();
  GeneratedTextColumn _constructCity() {
    return GeneratedTextColumn(
      'city',
      $tableName,
      true,
    );
  }

  final VerificationMeta _stateMeta = const VerificationMeta('state');
  GeneratedTextColumn _state;
  @override
  GeneratedTextColumn get state => _state ??= _constructState();
  GeneratedTextColumn _constructState() {
    return GeneratedTextColumn(
      'state',
      $tableName,
      true,
    );
  }

  final VerificationMeta _phoneMeta = const VerificationMeta('phone');
  GeneratedTextColumn _phone;
  @override
  GeneratedTextColumn get phone => _phone ??= _constructPhone();
  GeneratedTextColumn _constructPhone() {
    return GeneratedTextColumn(
      'phone',
      $tableName,
      true,
    );
  }

  final VerificationMeta _emailMeta = const VerificationMeta('email');
  GeneratedTextColumn _email;
  @override
  GeneratedTextColumn get email => _email ??= _constructEmail();
  GeneratedTextColumn _constructEmail() {
    return GeneratedTextColumn(
      'email',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        lastName,
        postalCode,
        address,
        number,
        neighborhood,
        city,
        state,
        phone,
        email
      ];
  @override
  $ContactsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'contacts';
  @override
  final String actualTableName = 'contacts';
  @override
  VerificationContext validateIntegrity(Insertable<Contact> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name'], _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('last_name')) {
      context.handle(_lastNameMeta,
          lastName.isAcceptableOrUnknown(data['last_name'], _lastNameMeta));
    }
    if (data.containsKey('postal_code')) {
      context.handle(
          _postalCodeMeta,
          postalCode.isAcceptableOrUnknown(
              data['postal_code'], _postalCodeMeta));
    }
    if (data.containsKey('address')) {
      context.handle(_addressMeta,
          address.isAcceptableOrUnknown(data['address'], _addressMeta));
    }
    if (data.containsKey('number')) {
      context.handle(_numberMeta,
          number.isAcceptableOrUnknown(data['number'], _numberMeta));
    }
    if (data.containsKey('neighborhood')) {
      context.handle(
          _neighborhoodMeta,
          neighborhood.isAcceptableOrUnknown(
              data['neighborhood'], _neighborhoodMeta));
    }
    if (data.containsKey('city')) {
      context.handle(
          _cityMeta, city.isAcceptableOrUnknown(data['city'], _cityMeta));
    }
    if (data.containsKey('state')) {
      context.handle(
          _stateMeta, state.isAcceptableOrUnknown(data['state'], _stateMeta));
    }
    if (data.containsKey('phone')) {
      context.handle(
          _phoneMeta, phone.isAcceptableOrUnknown(data['phone'], _phoneMeta));
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email'], _emailMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Contact map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Contact.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $ContactsTable createAlias(String alias) {
    return $ContactsTable(_db, alias);
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $ContactsTable _contacts;
  $ContactsTable get contacts => _contacts ??= $ContactsTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [contacts];
}
