import 'package:drift/drift.dart';
import 'package:tr_store/core/app_database/app_database.dart';
import 'package:tr_store/database/fetched_products/fetch_products.dart';

part 'fetch_products_dao.g.dart';

@DriftAccessor(tables: [FetchProducts])
class FetchProductsDao extends DatabaseAccessor<AppDatabase>
    with _$FetchProductsDaoMixin {
  FetchProductsDao(AppDatabase db) : super(db);
}
