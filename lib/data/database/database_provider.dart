import 'package:realm/realm.dart';
import 'package:rzagram/data/database/database_provider_ac.dart';

class DatabaseProvider extends DatabaseProviderAC {
  final Realm _realm;

  DatabaseProvider(this._realm);

  @override
  List<T> readAll<T extends RealmObject>() {
    final objects = _realm.all<T>();
    return [...objects.map((obj) => obj)];
  }

  @override
  List<T> read<T extends RealmObject>({required bool Function(T) where}) {
    return [..._realm.all<T>().where(where)];
  }

  @override
  void whiteOne<T extends RealmObject>({required T object}) {
    _realm.write(() {
      _realm.add(object, update: true);
    });
  }

  @override
  void write<T extends RealmObject>({required List<T> objects}) {
    _realm.write(() {
      _realm.addAll(objects, update: true);
    });
  }

  @override
  void deleteAll<T extends RealmObject>() {
    List<T> objects = readAll();
    _realm.write(() {
      _realm.deleteMany(objects);
    });
  }

  @override
  void delete<T extends RealmObject>({required bool Function(T) where}) {
    List<T> objects = read(where: where);
    _realm.write(() {
      _realm.deleteMany(objects);
    });
  }
}
