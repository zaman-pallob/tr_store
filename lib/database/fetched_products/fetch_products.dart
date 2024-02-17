import 'package:drift/drift.dart';

@DataClassName("FetchProductsModel")
class FetchProducts extends Table {
  IntColumn get id => integer().nullable()();
  TextColumn get title => text().nullable()();
  TextColumn get price => text().nullable()();
  TextColumn get image => text().nullable()();
  TextColumn get content => text().nullable()();
}
