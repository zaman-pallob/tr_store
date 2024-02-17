// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $MyCartProductsTable extends MyCartProducts
    with TableInfo<$MyCartProductsTable, MyCartProductModel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MyCartProductsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<String> price = GeneratedColumn<String>(
      'price', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _imageMeta = const VerificationMeta('image');
  @override
  late final GeneratedColumn<String> image = GeneratedColumn<String>(
      'image', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _quantityMeta =
      const VerificationMeta('quantity');
  @override
  late final GeneratedColumn<int> quantity = GeneratedColumn<int>(
      'quantity', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name, price, image, quantity];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'my_cart_products';
  @override
  VerificationContext validateIntegrity(Insertable<MyCartProductModel> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('price')) {
      context.handle(
          _priceMeta, price.isAcceptableOrUnknown(data['price']!, _priceMeta));
    } else if (isInserting) {
      context.missing(_priceMeta);
    }
    if (data.containsKey('image')) {
      context.handle(
          _imageMeta, image.isAcceptableOrUnknown(data['image']!, _imageMeta));
    } else if (isInserting) {
      context.missing(_imageMeta);
    }
    if (data.containsKey('quantity')) {
      context.handle(_quantityMeta,
          quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta));
    } else if (isInserting) {
      context.missing(_quantityMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  MyCartProductModel map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MyCartProductModel(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      price: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}price'])!,
      image: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image'])!,
      quantity: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}quantity'])!,
    );
  }

  @override
  $MyCartProductsTable createAlias(String alias) {
    return $MyCartProductsTable(attachedDatabase, alias);
  }
}

class MyCartProductModel extends DataClass
    implements Insertable<MyCartProductModel> {
  final String id;
  final String name;
  final String price;
  final String image;
  final int quantity;
  const MyCartProductModel(
      {required this.id,
      required this.name,
      required this.price,
      required this.image,
      required this.quantity});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['price'] = Variable<String>(price);
    map['image'] = Variable<String>(image);
    map['quantity'] = Variable<int>(quantity);
    return map;
  }

  MyCartProductsCompanion toCompanion(bool nullToAbsent) {
    return MyCartProductsCompanion(
      id: Value(id),
      name: Value(name),
      price: Value(price),
      image: Value(image),
      quantity: Value(quantity),
    );
  }

  factory MyCartProductModel.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MyCartProductModel(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      price: serializer.fromJson<String>(json['price']),
      image: serializer.fromJson<String>(json['image']),
      quantity: serializer.fromJson<int>(json['quantity']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'price': serializer.toJson<String>(price),
      'image': serializer.toJson<String>(image),
      'quantity': serializer.toJson<int>(quantity),
    };
  }

  MyCartProductModel copyWith(
          {String? id,
          String? name,
          String? price,
          String? image,
          int? quantity}) =>
      MyCartProductModel(
        id: id ?? this.id,
        name: name ?? this.name,
        price: price ?? this.price,
        image: image ?? this.image,
        quantity: quantity ?? this.quantity,
      );
  @override
  String toString() {
    return (StringBuffer('MyCartProductModel(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('price: $price, ')
          ..write('image: $image, ')
          ..write('quantity: $quantity')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, price, image, quantity);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MyCartProductModel &&
          other.id == this.id &&
          other.name == this.name &&
          other.price == this.price &&
          other.image == this.image &&
          other.quantity == this.quantity);
}

class MyCartProductsCompanion extends UpdateCompanion<MyCartProductModel> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> price;
  final Value<String> image;
  final Value<int> quantity;
  final Value<int> rowid;
  const MyCartProductsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.price = const Value.absent(),
    this.image = const Value.absent(),
    this.quantity = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MyCartProductsCompanion.insert({
    required String id,
    required String name,
    required String price,
    required String image,
    required int quantity,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name),
        price = Value(price),
        image = Value(image),
        quantity = Value(quantity);
  static Insertable<MyCartProductModel> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? price,
    Expression<String>? image,
    Expression<int>? quantity,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (price != null) 'price': price,
      if (image != null) 'image': image,
      if (quantity != null) 'quantity': quantity,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MyCartProductsCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<String>? price,
      Value<String>? image,
      Value<int>? quantity,
      Value<int>? rowid}) {
    return MyCartProductsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      image: image ?? this.image,
      quantity: quantity ?? this.quantity,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (price.present) {
      map['price'] = Variable<String>(price.value);
    }
    if (image.present) {
      map['image'] = Variable<String>(image.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<int>(quantity.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MyCartProductsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('price: $price, ')
          ..write('image: $image, ')
          ..write('quantity: $quantity, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $FetchProductsTable extends FetchProducts
    with TableInfo<$FetchProductsTable, FetchProductsModel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FetchProductsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<String> price = GeneratedColumn<String>(
      'price', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _imageMeta = const VerificationMeta('image');
  @override
  late final GeneratedColumn<String> image = GeneratedColumn<String>(
      'image', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _contentMeta =
      const VerificationMeta('content');
  @override
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
      'content', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _quantityMeta =
      const VerificationMeta('quantity');
  @override
  late final GeneratedColumn<int> quantity = GeneratedColumn<int>(
      'quantity', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, title, price, image, content, quantity];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'fetch_products';
  @override
  VerificationContext validateIntegrity(Insertable<FetchProductsModel> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('price')) {
      context.handle(
          _priceMeta, price.isAcceptableOrUnknown(data['price']!, _priceMeta));
    } else if (isInserting) {
      context.missing(_priceMeta);
    }
    if (data.containsKey('image')) {
      context.handle(
          _imageMeta, image.isAcceptableOrUnknown(data['image']!, _imageMeta));
    } else if (isInserting) {
      context.missing(_imageMeta);
    }
    if (data.containsKey('content')) {
      context.handle(_contentMeta,
          content.isAcceptableOrUnknown(data['content']!, _contentMeta));
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    if (data.containsKey('quantity')) {
      context.handle(_quantityMeta,
          quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta));
    } else if (isInserting) {
      context.missing(_quantityMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  FetchProductsModel map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FetchProductsModel(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id']),
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      price: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}price'])!,
      image: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image'])!,
      content: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}content'])!,
      quantity: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}quantity'])!,
    );
  }

  @override
  $FetchProductsTable createAlias(String alias) {
    return $FetchProductsTable(attachedDatabase, alias);
  }
}

class FetchProductsModel extends DataClass
    implements Insertable<FetchProductsModel> {
  final int? id;
  final String title;
  final String price;
  final String image;
  final String content;
  final int quantity;
  const FetchProductsModel(
      {this.id,
      required this.title,
      required this.price,
      required this.image,
      required this.content,
      required this.quantity});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    map['title'] = Variable<String>(title);
    map['price'] = Variable<String>(price);
    map['image'] = Variable<String>(image);
    map['content'] = Variable<String>(content);
    map['quantity'] = Variable<int>(quantity);
    return map;
  }

  FetchProductsCompanion toCompanion(bool nullToAbsent) {
    return FetchProductsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      title: Value(title),
      price: Value(price),
      image: Value(image),
      content: Value(content),
      quantity: Value(quantity),
    );
  }

  factory FetchProductsModel.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FetchProductsModel(
      id: serializer.fromJson<int?>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      price: serializer.fromJson<String>(json['price']),
      image: serializer.fromJson<String>(json['image']),
      content: serializer.fromJson<String>(json['content']),
      quantity: serializer.fromJson<int>(json['quantity']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int?>(id),
      'title': serializer.toJson<String>(title),
      'price': serializer.toJson<String>(price),
      'image': serializer.toJson<String>(image),
      'content': serializer.toJson<String>(content),
      'quantity': serializer.toJson<int>(quantity),
    };
  }

  FetchProductsModel copyWith(
          {Value<int?> id = const Value.absent(),
          String? title,
          String? price,
          String? image,
          String? content,
          int? quantity}) =>
      FetchProductsModel(
        id: id.present ? id.value : this.id,
        title: title ?? this.title,
        price: price ?? this.price,
        image: image ?? this.image,
        content: content ?? this.content,
        quantity: quantity ?? this.quantity,
      );
  @override
  String toString() {
    return (StringBuffer('FetchProductsModel(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('price: $price, ')
          ..write('image: $image, ')
          ..write('content: $content, ')
          ..write('quantity: $quantity')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, price, image, content, quantity);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FetchProductsModel &&
          other.id == this.id &&
          other.title == this.title &&
          other.price == this.price &&
          other.image == this.image &&
          other.content == this.content &&
          other.quantity == this.quantity);
}

class FetchProductsCompanion extends UpdateCompanion<FetchProductsModel> {
  final Value<int?> id;
  final Value<String> title;
  final Value<String> price;
  final Value<String> image;
  final Value<String> content;
  final Value<int> quantity;
  final Value<int> rowid;
  const FetchProductsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.price = const Value.absent(),
    this.image = const Value.absent(),
    this.content = const Value.absent(),
    this.quantity = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  FetchProductsCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required String price,
    required String image,
    required String content,
    required int quantity,
    this.rowid = const Value.absent(),
  })  : title = Value(title),
        price = Value(price),
        image = Value(image),
        content = Value(content),
        quantity = Value(quantity);
  static Insertable<FetchProductsModel> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? price,
    Expression<String>? image,
    Expression<String>? content,
    Expression<int>? quantity,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (price != null) 'price': price,
      if (image != null) 'image': image,
      if (content != null) 'content': content,
      if (quantity != null) 'quantity': quantity,
      if (rowid != null) 'rowid': rowid,
    });
  }

  FetchProductsCompanion copyWith(
      {Value<int?>? id,
      Value<String>? title,
      Value<String>? price,
      Value<String>? image,
      Value<String>? content,
      Value<int>? quantity,
      Value<int>? rowid}) {
    return FetchProductsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      price: price ?? this.price,
      image: image ?? this.image,
      content: content ?? this.content,
      quantity: quantity ?? this.quantity,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (price.present) {
      map['price'] = Variable<String>(price.value);
    }
    if (image.present) {
      map['image'] = Variable<String>(image.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<int>(quantity.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FetchProductsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('price: $price, ')
          ..write('image: $image, ')
          ..write('content: $content, ')
          ..write('quantity: $quantity, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  late final $MyCartProductsTable myCartProducts = $MyCartProductsTable(this);
  late final $FetchProductsTable fetchProducts = $FetchProductsTable(this);
  late final MyCartDao myCartDao = MyCartDao(this as AppDatabase);
  late final FetchProductsDao fetchProductsDao =
      FetchProductsDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [myCartProducts, fetchProducts];
}
