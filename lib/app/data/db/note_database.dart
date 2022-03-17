import 'package:moor_flutter/moor_flutter.dart';

part 'note_database.g.dart';

class Notes extends Table {
  IntColumn get id => integer().autoIncrement().nullable()();
  TextColumn get title => text().withLength(min: 1, max: 100)();
  TextColumn get desc => text().withLength(min: 1, max: 255)();
}

@UseMoor(tables: [Notes])
class NoteManager extends _$NoteManager {
  NoteManager()
      : super(FlutterQueryExecutor.inDatabaseFolder(path: "notes.sqlite"));

  @override
  int get schemaVersion => 1;

  // CRUD
  // FETCH DATA ( READ DATA)
  Future<List<Note>> fetchAllNotes() => select(notes).get();

  Stream<List<Note>> StreamAllNotes() => select(notes).watch();

  // INSERT DATA NOTE
  Future<int> insertNote(Note note) => into(notes).insert(note);

  // UPDATE DATA NOTE
  Future<bool> updateNote(Note note) => update(notes).replace(note);

  // DELETE DATA NOTE
  Future<int> deleteNote(Note note) => delete(notes).delete(note);
}
