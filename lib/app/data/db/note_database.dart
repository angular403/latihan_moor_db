import 'package:moor_flutter/moor_flutter.dart';

part 'note_database.g.dart';

class Notes extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text().withLength(min: 1, max: 100)();
  TextColumn get desc => text().withLength(min: 1, max: 255)();
}

@UseMoor(tables: [Notes])
class NoteManager extends _$NoteManager {
  NoteManager()
      : super(FlutterQueryExecutor.inDatabaseFolder(path: "notes.sqlite"));

@override 
int get schemaVersion => 1;

}
