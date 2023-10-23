import 'package:bloc_notes/home.dart';
import 'package:flutter/material.dart';
import 'package:bloc_notes/show.dart';
import 'package:bloc_notes/ajout.dart';
class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Note'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              // Action à effectuer lorsque l'icône de menu est pressée
            },
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            color: Colors.grey.shade200,
            padding: EdgeInsets.all(16),
            child: Row(
              children: <Widget>[
                Icon(Icons.search),
                SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Rechercher...',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                Container(
                  color: Colors.blue,
                  child: ListTile(
                    title: Text('Favoris', style: TextStyle(color: Colors.white)),
                  ),
                ),
                MesNote(titre: 'Note 1', contenu: 'Contenu de la note 1'),
                MesNote(titre: 'Note 2', contenu: 'Contenu de la note 2'),
                MesNote(titre: 'Note 3', contenu: 'Contenu de la note 3'),

                Container(
                  margin: EdgeInsets.only(top: 10), // Marge en haut
                  color: Colors.blue,
                  child: ListTile(
                    title: Text('Derniers ajouts', style: TextStyle(color: Colors.white)),
                  ),
                ),
                MesNote(titre: 'Note 4', contenu: 'Contenu de la note 1'),
                MesNote(titre: 'Note 5', contenu: 'Contenu de la note 2'),
                MesNote(titre: 'Note 6', contenu: 'Contenu de la note 3'),

              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => MyShowPage(), // Remplacez par le bon nom de la page
          ));
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
//Creer un classe MesNotes ayant deux variable
class MesNote extends StatelessWidget {
  // Declaration de mes Variable
  final String titre;
  final String contenu;

  MesNote({required this.titre, required this.contenu});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 7, // Ajoute un effet drop shadow
      shadowColor: Colors.black,
      margin: EdgeInsets.all(7), // Ajoute un espacement entre les notes
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(9), // Ajoute un border radius de 9 pixels
      ),

      child: ListTile(
        title: Text(titre),
        subtitle: Text(contenu),
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => MyShowPage(),
          ));
        },
      ),
    );
  }
}

