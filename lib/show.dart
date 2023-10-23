import 'package:bloc_notes/main.dart';
import 'package:flutter/material.dart';
import 'package:bloc_notes/home.dart';


class MyShowPage extends StatelessWidget {
  const MyShowPage({super.key});

  //Fonction pour ajouter la note
  Future<void> _saveNote() async {
    final url=Uri.parse('http://127.0.0.1:8000/api/note');
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
    );
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
                color: Colors.blueGrey, // Couleur de fond bleu ciel
                borderRadius: BorderRadius.circular(10), // Border radius de 10px
              ),
              child: TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Titre',
                  contentPadding: EdgeInsets.all(16),
                  border: InputBorder.none,
                  hintStyle: TextStyle(
                    color: Colors.white, // Couleur du texte "Titre" en blanc
                    fontSize: 17,
                    fontWeight: FontWeight.w700, // Police en gras
                  ),
                ),
              ),
            ),
            SizedBox(height: 16), // Espacement entre les deux conteneurs
            Container(
              decoration: BoxDecoration(
                color: Colors.blueGrey, // Couleur de fond bleu ciel
                borderRadius: BorderRadius.circular(10), // Border radius de 10px
              ),
              child: TextFormField(
                maxLines: 10, // Pour permettre plusieurs lignes de contenu
                decoration: const InputDecoration(
                  hintText: 'Contenu',
                  contentPadding: EdgeInsets.all(16),
                  border: InputBorder.none,
                  hintStyle: TextStyle(
                    color: Colors.white, // Couleur du texte "Titre" en blanc
                    fontSize: 17,
                    fontWeight: FontWeight.w700, // Police en gras
                  ),
                ),
              ),
            ),
            SizedBox(height: 25), // Espacement entre le deuxième conteneur et le bouton
            ElevatedButton(
              onPressed: () {
                // Action à effectuer lorsque le bouton "Enregistrer" est pressé
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.blue), // Couleur de fond bleue
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15), // Border radius de 15px
                  ),
                ),
              ),
              child: const Text('Enregistrer', style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.w700)),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
