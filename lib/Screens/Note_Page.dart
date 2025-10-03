import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:note_app/Models/note.dart';
import 'package:note_app/Screens/detales_page_note.dart';
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

  int _selectedIndex = 0;

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff152e6a),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text(
            'My Notes',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          actions: [
            ElevatedButton.icon(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  Color(0xff152e6a),
                ),
                shape: MaterialStateProperty.all<LinearBorder>(
                  LinearBorder.none,
                ),
                elevation: MaterialStateProperty.all<double>(0),
                shadowColor: MaterialStateProperty.all<Color>(
                  Colors.transparent,
                ),
              ),
              label: Text(
                "Add New",
                style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              icon: Icon(Icons.add, color: Colors.blueGrey),
              onPressed: _addNoteDialog,
            ),
          ],
          backgroundColor: Color(0xff152e6a),
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
                    child: MasonryGridView.builder(
                      padding: const EdgeInsets.all(12),
                      gridDelegate:
                          const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, // 2 columns
                          ),
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 12,
                      itemCount: notes.length,
                      itemBuilder: (context, index) {
                        final note = notes[index];

                        final gradients = [
                          [Colors.teal, Colors.greenAccent],
                          [Colors.amber, Colors.orange],
                          [Colors.cyan, Colors.teal],
                          [Colors.indigo, Colors.blueAccent],
                        ];
                        final gradient = gradients[index % gradients.length];

                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const DetalesPageNote(),
                                settings: RouteSettings(arguments: note),
                              ),
                            );
                          },
                          onLongPress: () {
                            if (note.id != null) {
                              _deleteNote(note.id!);
                            }
                          },
                          child: Container(
                            padding: EdgeInsets.all(14),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: gradient,
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.15),
                                  blurRadius: 6,
                                  offset: const Offset(2, 4),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  note.title,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  note.content,
                                  style: const TextStyle(
                                    color: Colors.white70,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
        floatingActionButton: FloatingActionButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          backgroundColor: Color(0xff0a3697),
          child: const Icon(Icons.edit_outlined, color: Colors.white),
          onPressed: () {},
        ),

        bottomNavigationBar: Container(
          color: Color(0xff152e6a),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
            child: BottomNavigationBar(
              backgroundColor: Color(0xFF092462),
              elevation: 0,
              currentIndex: _selectedIndex,
              type: BottomNavigationBarType.fixed,
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.white,
              onTap: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.notifications_none_outlined),
                  label: "",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.search_outlined),
                  label: "",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.credit_card),
                  label: "",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings_outlined),
                  label: "",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
