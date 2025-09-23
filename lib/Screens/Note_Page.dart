import 'package:flutter/material.dart';
import 'package:note_app/Models/note.dart';
import 'package:note_app/Servies/DataBase_Helper.dart';

class NotePage extends StatefulWidget {
  const NotePage({super.key});

  @override
  State<NotePage> createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  final DB_Helper = DatabaseHelper();

  List<Note> notes = [];

  // contrllers
  final Titlecontroller = TextEditingController();
  final Contactcontroller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _refreshNotes();
  }

  Future<void> _refreshNotes() async {
    final data = await DB_Helper.GetAllNotes();
    setState(() {
      notes = data;
    });
  }

  Future<void> _addNote() async {
    final note = Note(
      title: Titlecontroller.text,
      content: Contactcontroller.text,
    );
    await DB_Helper.InsertNote(note);

    Titlecontroller.clear();
    Contactcontroller.clear();

    _refreshNotes();
  }

  Future<void> _deleteNote(int id) async {
    await DB_Helper.DeleteNote(id);
    _refreshNotes();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Note Application')),
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: Titlecontroller,
              decoration: InputDecoration(label: Text("Title")),
            ),

            SizedBox(height: 20),

            TextField(
              controller: Contactcontroller,
              decoration: InputDecoration(label: Text("Contact")),
            ),

            SizedBox(height: 20),

            ElevatedButton(onPressed: _addNote, child: Text("add note")),

            SizedBox(height: 20),

            Expanded(
              child: ListView.builder(
                itemCount: notes.length,
                itemBuilder: (context, index) {
                  final note = notes[index];
                  return ListTile(
                    title: Text(note.title),
                    subtitle: Text(note.content),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        _deleteNote(note.id!);
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
