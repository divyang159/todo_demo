import 'package:realm/realm.dart';

part 'database_model.g.dart';

@RealmModel()
class _Todo {
  @PrimaryKey()
  late  String isbn10;

  late String title;
  late final String? description;
}
