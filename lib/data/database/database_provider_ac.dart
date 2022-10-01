import 'package:realm/realm.dart';

abstract class DatabaseProviderAC {
  List<T> readAll<T extends RealmObject>();
  List<T> read<T extends RealmObject>({required bool Function(T) where});
  void write<T extends RealmObject>({required List<T> objects});
  void whiteOne<T extends RealmObject>({required T object});
  void deleteAll<T extends RealmObject>();
  void delete<T extends RealmObject>({required bool Function(T) where});
}
