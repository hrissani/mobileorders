// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moor_db.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class user_s extends DataClass implements Insertable<user_s> {
  final int? id;
  final String? name;
  final String? email;
  final String? date;
  user_s({this.id, this.name, this.email, this.date});
  factory user_s.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return user_s(
      id: const IntType().mapFromDatabaseResponse(data['${effectivePrefix}id']),
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name']),
      email: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}email']),
      date: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}date']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int?>(id);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String?>(name);
    }
    if (!nullToAbsent || email != null) {
      map['email'] = Variable<String?>(email);
    }
    if (!nullToAbsent || date != null) {
      map['date'] = Variable<String?>(date);
    }
    return map;
  }

  UserSCompanion toCompanion(bool nullToAbsent) {
    return UserSCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      email:
          email == null && nullToAbsent ? const Value.absent() : Value(email),
      date: date == null && nullToAbsent ? const Value.absent() : Value(date),
    );
  }

  factory user_s.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return user_s(
      id: serializer.fromJson<int?>(json['id']),
      name: serializer.fromJson<String?>(json['name']),
      email: serializer.fromJson<String?>(json['email']),
      date: serializer.fromJson<String?>(json['date']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int?>(id),
      'name': serializer.toJson<String?>(name),
      'email': serializer.toJson<String?>(email),
      'date': serializer.toJson<String?>(date),
    };
  }

  user_s copyWith({int? id, String? name, String? email, String? date}) =>
      user_s(
        id: id ?? this.id,
        name: name ?? this.name,
        email: email ?? this.email,
        date: date ?? this.date,
      );
  @override
  String toString() {
    return (StringBuffer('user_s(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('email: $email, ')
          ..write('date: $date')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, email, date);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is user_s &&
          other.id == this.id &&
          other.name == this.name &&
          other.email == this.email &&
          other.date == this.date);
}

class UserSCompanion extends UpdateCompanion<user_s> {
  final Value<int?> id;
  final Value<String?> name;
  final Value<String?> email;
  final Value<String?> date;
  const UserSCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.email = const Value.absent(),
    this.date = const Value.absent(),
  });
  UserSCompanion.insert({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.email = const Value.absent(),
    this.date = const Value.absent(),
  });
  static Insertable<user_s> custom({
    Expression<int?>? id,
    Expression<String?>? name,
    Expression<String?>? email,
    Expression<String?>? date,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (email != null) 'email': email,
      if (date != null) 'date': date,
    });
  }

  UserSCompanion copyWith(
      {Value<int?>? id,
      Value<String?>? name,
      Value<String?>? email,
      Value<String?>? date}) {
    return UserSCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      date: date ?? this.date,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int?>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String?>(name.value);
    }
    if (email.present) {
      map['email'] = Variable<String?>(email.value);
    }
    if (date.present) {
      map['date'] = Variable<String?>(date.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserSCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('email: $email, ')
          ..write('date: $date')
          ..write(')'))
        .toString();
  }
}

class $UserSTable extends UserS with TableInfo<$UserSTable, user_s> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserSTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String?> email = GeneratedColumn<String?>(
      'email', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<String?> date = GeneratedColumn<String?>(
      'date', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [id, name, email, date];
  @override
  String get aliasedName => _alias ?? 'user_s';
  @override
  String get actualTableName => 'user_s';
  @override
  VerificationContext validateIntegrity(Insertable<user_s> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  user_s map(Map<String, dynamic> data, {String? tablePrefix}) {
    return user_s.fromData(data, attachedDatabase,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $UserSTable createAlias(String alias) {
    return $UserSTable(attachedDatabase, alias);
  }
}

class order_s extends DataClass implements Insertable<order_s> {
  final int? id;
  final String? hotelId;
  final String? hotelName;
  final String? builderName;
  order_s({this.id, this.hotelId, this.hotelName, this.builderName});
  factory order_s.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return order_s(
      id: const IntType().mapFromDatabaseResponse(data['${effectivePrefix}id']),
      hotelId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}hotel_id']),
      hotelName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}hotel_name']),
      builderName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}builder_name']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int?>(id);
    }
    if (!nullToAbsent || hotelId != null) {
      map['hotel_id'] = Variable<String?>(hotelId);
    }
    if (!nullToAbsent || hotelName != null) {
      map['hotel_name'] = Variable<String?>(hotelName);
    }
    if (!nullToAbsent || builderName != null) {
      map['builder_name'] = Variable<String?>(builderName);
    }
    return map;
  }

  OrderSCompanion toCompanion(bool nullToAbsent) {
    return OrderSCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      hotelId: hotelId == null && nullToAbsent
          ? const Value.absent()
          : Value(hotelId),
      hotelName: hotelName == null && nullToAbsent
          ? const Value.absent()
          : Value(hotelName),
      builderName: builderName == null && nullToAbsent
          ? const Value.absent()
          : Value(builderName),
    );
  }

  factory order_s.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return order_s(
      id: serializer.fromJson<int?>(json['id']),
      hotelId: serializer.fromJson<String?>(json['hotelId']),
      hotelName: serializer.fromJson<String?>(json['hotelName']),
      builderName: serializer.fromJson<String?>(json['builderName']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int?>(id),
      'hotelId': serializer.toJson<String?>(hotelId),
      'hotelName': serializer.toJson<String?>(hotelName),
      'builderName': serializer.toJson<String?>(builderName),
    };
  }

  order_s copyWith(
          {int? id, String? hotelId, String? hotelName, String? builderName}) =>
      order_s(
        id: id ?? this.id,
        hotelId: hotelId ?? this.hotelId,
        hotelName: hotelName ?? this.hotelName,
        builderName: builderName ?? this.builderName,
      );
  @override
  String toString() {
    return (StringBuffer('order_s(')
          ..write('id: $id, ')
          ..write('hotelId: $hotelId, ')
          ..write('hotelName: $hotelName, ')
          ..write('builderName: $builderName')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, hotelId, hotelName, builderName);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is order_s &&
          other.id == this.id &&
          other.hotelId == this.hotelId &&
          other.hotelName == this.hotelName &&
          other.builderName == this.builderName);
}

class OrderSCompanion extends UpdateCompanion<order_s> {
  final Value<int?> id;
  final Value<String?> hotelId;
  final Value<String?> hotelName;
  final Value<String?> builderName;
  const OrderSCompanion({
    this.id = const Value.absent(),
    this.hotelId = const Value.absent(),
    this.hotelName = const Value.absent(),
    this.builderName = const Value.absent(),
  });
  OrderSCompanion.insert({
    this.id = const Value.absent(),
    this.hotelId = const Value.absent(),
    this.hotelName = const Value.absent(),
    this.builderName = const Value.absent(),
  });
  static Insertable<order_s> custom({
    Expression<int?>? id,
    Expression<String?>? hotelId,
    Expression<String?>? hotelName,
    Expression<String?>? builderName,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (hotelId != null) 'hotel_id': hotelId,
      if (hotelName != null) 'hotel_name': hotelName,
      if (builderName != null) 'builder_name': builderName,
    });
  }

  OrderSCompanion copyWith(
      {Value<int?>? id,
      Value<String?>? hotelId,
      Value<String?>? hotelName,
      Value<String?>? builderName}) {
    return OrderSCompanion(
      id: id ?? this.id,
      hotelId: hotelId ?? this.hotelId,
      hotelName: hotelName ?? this.hotelName,
      builderName: builderName ?? this.builderName,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int?>(id.value);
    }
    if (hotelId.present) {
      map['hotel_id'] = Variable<String?>(hotelId.value);
    }
    if (hotelName.present) {
      map['hotel_name'] = Variable<String?>(hotelName.value);
    }
    if (builderName.present) {
      map['builder_name'] = Variable<String?>(builderName.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OrderSCompanion(')
          ..write('id: $id, ')
          ..write('hotelId: $hotelId, ')
          ..write('hotelName: $hotelName, ')
          ..write('builderName: $builderName')
          ..write(')'))
        .toString();
  }
}

class $OrderSTable extends OrderS with TableInfo<$OrderSTable, order_s> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $OrderSTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _hotelIdMeta = const VerificationMeta('hotelId');
  @override
  late final GeneratedColumn<String?> hotelId = GeneratedColumn<String?>(
      'hotel_id', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _hotelNameMeta = const VerificationMeta('hotelName');
  @override
  late final GeneratedColumn<String?> hotelName = GeneratedColumn<String?>(
      'hotel_name', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _builderNameMeta =
      const VerificationMeta('builderName');
  @override
  late final GeneratedColumn<String?> builderName = GeneratedColumn<String?>(
      'builder_name', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [id, hotelId, hotelName, builderName];
  @override
  String get aliasedName => _alias ?? 'order_s';
  @override
  String get actualTableName => 'order_s';
  @override
  VerificationContext validateIntegrity(Insertable<order_s> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('hotel_id')) {
      context.handle(_hotelIdMeta,
          hotelId.isAcceptableOrUnknown(data['hotel_id']!, _hotelIdMeta));
    }
    if (data.containsKey('hotel_name')) {
      context.handle(_hotelNameMeta,
          hotelName.isAcceptableOrUnknown(data['hotel_name']!, _hotelNameMeta));
    }
    if (data.containsKey('builder_name')) {
      context.handle(
          _builderNameMeta,
          builderName.isAcceptableOrUnknown(
              data['builder_name']!, _builderNameMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  order_s map(Map<String, dynamic> data, {String? tablePrefix}) {
    return order_s.fromData(data, attachedDatabase,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $OrderSTable createAlias(String alias) {
    return $OrderSTable(attachedDatabase, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $UserSTable userS = $UserSTable(this);
  late final $OrderSTable orderS = $OrderSTable(this);
  late final ApplicarionDao applicarionDao =
      ApplicarionDao(this as AppDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [userS, orderS];
}
