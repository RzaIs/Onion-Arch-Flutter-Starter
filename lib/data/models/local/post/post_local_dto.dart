import 'package:realm/realm.dart';

part 'post_local_dto.g.dart';

@RealmModel()
class _PostLocalDTO {
  @PrimaryKey()
  late final int id;
  late final String title;
  late final String body;
  late final int userId;
}
