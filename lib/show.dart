import 'dart:convert';

import 'package:bloc_notes/main.dart';
import 'package:flutter/material.dart';
import 'package:bloc_notes/home.dart';
import 'package:http/http.dart' as http;

class MyShowPage extends StatefulWidget {
  MyShowPage({Key? key}) : super(key: key);

  @override
  _MyShowPageState createState() => _MyShowPageState();
}

class _MyShowPageState extends State<MyShowPage> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();

  // Fonction pour ajouter la note
  Future<void> _saveNote() async {
    final url = Uri.parse('http://127.0.0.1:8000/api/note');
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'titre': titleController.text, // Utilisez la valeur du contrôleur du titre
        'contenu': contentController.text, // Utilisez la valeur du contrôleur du contenu
      }),
    );
    if (response.statusCode == 200) {
      // gestion des reponses
      print('Note enregistree avec succes.');
    } else {
      // La requête a échoué, vous pouvez gérer les erreurs ici
      print('Erreur lors de l enregistrement de la note.');
      }
      }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajouter une note'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            SizedBox(height: 100),
            Container(
              decoration: BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextFormField(
                controller: titleController, // Utilisez le contrôleur du titre
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
            Container(
              decoration: BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextFormField(
                controller: contentController, // Utilisez le contrôleur du contenu
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
            SizedBox(height: 25),

            InkWell(        //InkWell est un widget Flutter qui est utilisé pour ajouter des interactions clics ou touches
              onTap: () {
                _saveNote(); // Appeler la fonction pour enregistrer la note
                Navigator.of(context).pop(); // Naviguer vers la page d'accueil
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: EdgeInsets.all(16),
                child: const Center(
                  child: Text(
                    'Enregistrer',
                    style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            )

          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
