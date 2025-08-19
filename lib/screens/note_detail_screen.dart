import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/note.dart';
import '../providers/notes_provider.dart';
import 'edit_note_screen.dart';

class NoteDetailScreen extends StatelessWidget {
  final Note note;
  final int index;

  const NoteDetailScreen({super.key, required this.note, required this.index});

  void _delete(BuildContext context) {
    Provider.of<NotesProvider>(context, listen: false).deleteNote(index);
    Navigator.pop(context);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Note Deleted!")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Note Details"),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => EditNoteScreen(note: note, index: index),
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () => _delete(context),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              note.title,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Text(note.description, style: const TextStyle(fontSize: 16)),
            const Spacer(),
            Text("Created: ${note.createdAt.toString().substring(0, 16)}",
                style: const TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}
