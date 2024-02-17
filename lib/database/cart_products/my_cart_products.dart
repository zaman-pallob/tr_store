import 'package:drift/drift.dart';

@DataClassName("MyCartProductModel")
class MyCartProducts extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get price => text()();
  TextColumn get image => text()();
  IntColumn get quantity => integer()();
}
