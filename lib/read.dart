import 'dart:convert';
import 'package:bloc_notes/read.dart';
import 'package:bloc_notes/main.dart';
import 'package:flutter/material.dart';
import 'package:bloc_notes/home.dart';
import 'package:http/http.dart' as http;

class MyReadPage extends StatefulWidget {
  final int noteId; // Ajout de l'ID de la note

  MyReadPage({Key? key, required this.noteId}) : super(key: key);

  @override
  _MyReadPageState createState() => _MyReadPageState();
}

class _MyReadPageState extends State<MyReadPage> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _fetchNoteDetails();
  }

  Future<void> _fetchNoteDetails() async {
    final response = await http.get(Uri.parse('http://127.0.0.1:8000/api/note/${widget.noteId}'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> noteData = json.decode(response.body);

      // Récupérer le titre et le contenu de la note
      final String titre = noteData['titre'];
      final String contenu = noteData['contenu'];

      // Mettre à jour les contrôleurs avec les données de la note
      titleController.text = titre;
      contentController.text = contenu;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Détail d\'une note'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            SizedBox(height: 20),
            // Zone de texte pour le titre de la note
            Container(
              decoration: BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextFormField(
                controller: titleController,
                decoration: const InputDecoration(
                  hintText: 'Titre',
                  contentPadding: EdgeInsets.all(16),
                  border: InputBorder.none,
                  hintStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            // Zone de texte pour le contenu de la note
            Container(
              decoration: BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextFormField(
                controller: contentController,
                maxLines: 10,
                decoration: const InputDecoration(
                  hintText: 'Contenu',
                  contentPadding: EdgeInsets.all(16),
                  border: InputBorder.none,
                  hintStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}