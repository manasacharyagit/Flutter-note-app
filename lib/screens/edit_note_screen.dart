import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/note.dart';
import '../providers/notes_provider.dart';

class EditNoteScreen extends StatefulWidget {
  final Note? note;
  final int? index;

  const EditNoteScreen({super.key, this.note, this.index});

  @override
  State<EditNoteScreen> createState() => _EditNoteScreenState();
}

class _EditNoteScreenState extends State<EditNoteScreen> {
  final _titleController = TextEditingController();
  final _descController = TextEditingController();
  final _tagsController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.note != null) {
      _titleController.text = widget.note!.title;
      _descController.text = widget.note!.description;
      _tagsController.text = widget.note!.tags.join(", ");
    }
  }

  @override
  Widget build(BuildContext context) {
    final notesProvider = Provider.of<NotesProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.note == null ? "Add Note" : "Edit Note"),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              final tags = _tagsController.text
                  .split(",")
                  .map((t) => t.trim())
                  .where((t) => t.isNotEmpty)
                  .toList();

              final note = Note(
                title: _titleController.text,
                description: _descController.text,
                createdAt: DateTime.now(),
                tags: tags,
              );

              if (widget.note == null) {
                notesProvider.addNote(note);
              } else {
                notesProvider.updateNote(widget.index!, note);
              }

              Navigator.pop(context);
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: "Title"),
            ),
            TextField(
              controller: _descController,
              decoration: const InputDecoration(labelText: "Description"),
              maxLines: 5,
            ),
            TextField(
              controller: _tagsController,
              decoration: const InputDecoration(
                labelText: "Tags (comma separated)",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
