// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_local_dto.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class PostLocalDTO extends _PostLocalDTO with RealmEntity, RealmObject {
  PostLocalDTO(
    int id,
    String title,
    String body,
    int userId,
  ) {
    RealmObject.set(this, 'id', id);
    RealmObject.set(this, 'title', title);
    RealmObject.set(this, 'body', body);
    RealmObject.set(this, 'userId', userId);
  }

  PostLocalDTO._();

  @override
  int get id => RealmObject.get<int>(this, 'id') as int;
  @override
  set id(int value) => throw RealmUnsupportedSetError();

  @override
  String get title => RealmObject.get<String>(this, 'title') as String;
  @override
  set title(String value) => throw RealmUnsupportedSetError();

  @override
  String get body => RealmObject.get<String>(this, 'body') as String;
  @override
  set body(String value) => throw RealmUnsupportedSetError();

  @override
  int get userId => RealmObject.get<int>(this, 'userId') as int;
  @override
  set userId(int value) => throw RealmUnsupportedSetError();

  @override
  Stream<RealmObjectChanges<PostLocalDTO>> get changes =>
      RealmObject.getChanges<PostLocalDTO>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObject.registerFactory(PostLocalDTO._);
    return const SchemaObject(PostLocalDTO, 'PostLocalDTO', [
      SchemaProperty('id', RealmPropertyType.int, primaryKey: true),
      SchemaProperty('title', RealmPropertyType.string),
      SchemaProperty('body', RealmPropertyType.string),
      SchemaProperty('userId', RealmPropertyType.int),
    ]);
  }
}
