import 'package:flutter/material.dart';
import 'package:note_app/Models/note.dart';
import 'package:note_app/generated/l10n.dart';

class DetalesPageNote extends StatelessWidget {
  const DetalesPageNote({super.key});

  @override
  Widget build(BuildContext context) {
    final Note note = ModalRoute.of(context)!.settings.arguments as Note;

    final gradients = [
      [Colors.teal, Colors.greenAccent],
      [Colors.amber, Colors.orange],
      [Colors.cyan, Colors.teal],
      [Colors.indigo, Colors.blueAccent],
    ];
    final gradient =
        gradients[note.id != null ? note.id! % gradients.length : 0];

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 70),
          child: Text(
            S.of(context).titleDetails,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.fromLTRB(20, 100, 20, 20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: gradient,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              Text(
                note.title,
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),

              // // Date (if available)
              // if (note.createdDate != null) ...[
              //   const SizedBox(height: 10),
              //   Text(
              //     "Created: ${DateTime.parse(note.createdDate!).toLocal()}",
              //     style: TextStyle(fontSize: 14, color: Colors.white70),
              //   ),
              //   const SizedBox(height: 20),
              // ],

              // Content
              Text(
                note.content,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  height: 1.6,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
