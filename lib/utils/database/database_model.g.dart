// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database_model.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class Todo extends _Todo with RealmEntity, RealmObjectBase, RealmObject {
  Todo(
    String isbn10,
    String title, {
    String? description,
  }) {
    RealmObjectBase.set(this, 'isbn10', isbn10);
    RealmObjectBase.set(this, 'title', title);
    RealmObjectBase.set(this, 'description', description);
  }

  Todo._();

  @override
  String get isbn10 => RealmObjectBase.get<String>(this, 'isbn10') as String;
  @override
  set isbn10(String value) => RealmObjectBase.set(this, 'isbn10', value);

  @override
  String get title => RealmObjectBase.get<String>(this, 'title') as String;
  @override
  set title(String value) => RealmObjectBase.set(this, 'title', value);

  @override
  String? get description =>
      RealmObjectBase.get<String>(this, 'description') as String?;
  @override
  set description(String? value) => throw RealmUnsupportedSetError();

  @override
  Stream<RealmObjectChanges<Todo>> get changes =>
      RealmObjectBase.getChanges<Todo>(this);

  @override
  Todo freeze() => RealmObjectBase.freezeObject<Todo>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(Todo._);
    return const SchemaObject(ObjectType.realmObject, Todo, 'Todo', [
      SchemaProperty('isbn10', RealmPropertyType.string, primaryKey: true),
      SchemaProperty('title', RealmPropertyType.string),
      SchemaProperty('description', RealmPropertyType.string, optional: true),
    ]);
  }
}
