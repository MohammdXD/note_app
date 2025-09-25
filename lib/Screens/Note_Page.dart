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
  final _formKey = GlobalKey<FormState>();
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
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(milliseconds: 1000),
        content: Text('Note deleted'),
        backgroundColor: Colors.red.shade900,
      ),
    );
  }

  void _submitNote() {
    if (_formKey.currentState!.validate()) {
      _addNote();
      Navigator.of(context).pop();
    }
  }

  void _addNoteDialog() {
    showModalBottomSheet(
      context: context,
      isDismissible: true,
      isScrollControlled: true,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            left: 20,
            right: 20,
            top: 20,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 5,
                width: 50,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              SizedBox(height: 20),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      validator: (value) =>
                          value!.isEmpty ? 'Please enter a title' : null,
                      controller: Titlecontroller,
                      decoration: InputDecoration(
                        labelText: "Title",
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        prefixIcon: Icon(Icons.title),
                        filled: true,
                        fillColor: Colors.blueAccent[50],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    TextFormField(
                      validator: (value) =>
                          value!.isEmpty ? 'Please enter a content' : null,
                      controller: Contactcontroller,
                      maxLines: 3,
                      decoration: InputDecoration(
                        labelText: "Content",
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        prefixIcon: const Icon(Icons.notes),
                        filled: true,
                        fillColor: Colors.blueAccent[50],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20),

              ElevatedButton.icon(
                onPressed: () {
                  _submitNote();
                },
                icon: Icon(Icons.add),
                label: Text("Add Note"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              SizedBox(height: 10),
            ],
          ),
        );
      },
    );
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Note Application',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.blue,
        ),
        body: notes.isEmpty
            ? const Center(
                child: Text(
                  "No notes yet. Tap + to add one!",
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              )
            : Column(
                children: [
                  SizedBox(height: 20),
                  Expanded(
                    child: ListView.builder(
                      itemCount: notes.length,
                      itemBuilder: (context, index) {
                        final note = notes[index];
                        return Card(
                          margin: EdgeInsets.symmetric(
                            vertical: 5,
                            horizontal: 15,
                          ),
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: ListTile(
                            title: Text(
                              note.title,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            subtitle: Padding(
                              padding: const EdgeInsets.only(top: 6),
                              child: Text(
                                note.content,
                                style: const TextStyle(fontSize: 15),
                              ),
                            ),
                            trailing: IconButton(
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.redAccent,
                              ),
                              onPressed: () => _deleteNote(note.id!),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          child: const Icon(Icons.add),
          onPressed: _addNoteDialog,
        ),
      ),
    );
  }
}
