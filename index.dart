
import 'package:bloc_notes/main.dart';
import 'package:flutter/material.dart';
import 'package:bloc_notes/home.dart';

class NoteDetailsPage extends StatefulWidget {
  const NoteDetailsPage({Key? key}) : super(key: key);

  @override
  _MyNoteDetailsPageState createState() => _MyNoteDetailsPageState();
}

class _MyNoteDetailsPageState extends State<NoteDetailsPage> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();


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
            const SizedBox(height: 16),
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
                    'Modifier',
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
