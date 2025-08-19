import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import '../models/note.dart';

class NotesProvider with ChangeNotifier {
  final Box<Note> _notesBox = Hive.box<Note>('notesBox');

  List<Note> get notes => _notesBox.values.toList();

  void addNote(Note note) {
    _notesBox.add(note);
    notifyListeners();
  }

  void updateNote(int index, Note updatedNote) {
    _notesBox.putAt(index, updatedNote);
    notifyListeners();
  }

  void deleteNote(int index) {
    _notesBox.deleteAt(index);
    notifyListeners();
  }
}
