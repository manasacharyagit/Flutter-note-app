import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/notes_provider.dart';
import '../models/note.dart';
import 'edit_note_screen.dart';
import 'note_detail_screen.dart';
import '../providers/theme_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String query = "";

  @override
  Widget build(BuildContext context) {
    final notesProvider = Provider.of<NotesProvider>(context);
    final notes = notesProvider.notes.where((note) {
      return note.title.toLowerCase().contains(query.toLowerCase());
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text("My Notes"),
        actions: [
          IconButton(
            icon: Icon(
              Provider.of<ThemeProvider>(context).isDarkMode
                  ? Icons.light_mode
                  : Icons.dark_mode,
            ),
            onPressed: () {
              Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
            },
          ),
        ],
      ),
      body: notes.isEmpty
          ? const Center(child: Text("No notes found"))
          : ListView.builder(
              itemCount: notes.length,
              itemBuilder: (context, index) {
                final Note note = notes[index];
                return Dismissible(
                  key: Key(note.createdAt.toIso8601String()),
                  direction: DismissDirection.endToStart,
                  onDismissed: (_) {
                    final originalIndex = notesProvider.notes.indexOf(note);
                    notesProvider.deleteNote(originalIndex);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Note Deleted!")),
                    );
                  },
                  background: Container(
                    color: Colors.red,
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: const Icon(Icons.delete, color: Colors.white),
                  ),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Colors.grey.shade400,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    margin:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    child: ListTile(
                      title: Text(note.title),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(note.description),
                          if (note.tags.isNotEmpty)
                            Wrap(
                              spacing: 6,
                              children: note.tags
                                  .map((tag) => Text(
                                        "#$tag",
                                        style: const TextStyle(
                                            color: Colors.blue),
                                      ))
                                  .toList(),
                            ),
                        ],
                      ),
                      onTap: () {
                        final originalIndex =
                            notesProvider.notes.indexOf(note);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => NoteDetailScreen(
                              note: note,
                              index: originalIndex,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const EditNoteScreen()),
          );
        },
      ),
    );
  }
}
