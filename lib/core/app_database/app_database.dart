// ignore_for_file: override_on_non_overriding_member

import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:sqlite3/sqlite3.dart';
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';
import 'package:tr_store/database/cart_products/my_cart_products.dart';
import 'package:tr_store/database/fetched_products/fetch_products.dart';

import '../../database/cart_products/my_cart_dao.dart';
import '../../database/fetched_products/fetch_products_dao.dart';
part 'app_database.g.dart';

@DriftDatabase(
    tables: [MyCartProducts, FetchProducts],
    daos: [MyCartDao, FetchProductsDao])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'tr_store.sqlite'));
    if (!await file.exists()) {
      if (Platform.isAndroid) {
        await applyWorkaroundToOpenSqlite3OnOldAndroidVersions();
      }

      final cachebase = (await getTemporaryDirectory()).path;

      sqlite3.tempDirectory = cachebase;

      return NativeDatabase.createInBackground(file);
    } else {
      return NativeDatabase(file);
    }
  });
}
