import 'package:drift/drift.dart';

@DataClassName("FetchProductsModel")
class FetchProducts extends Table {
  IntColumn get id => integer().nullable()();
  TextColumn get title => text()();
  TextColumn get price => text()();
  TextColumn get image => text()();
  TextColumn get content => text()();
  IntColumn get quantity => integer()();
}
