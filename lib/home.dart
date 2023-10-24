import 'package:bloc_notes/home.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:bloc_notes/show.dart';
import 'package:bloc_notes/read.dart';
import 'package:http/http.dart' as http;


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Pour masquer le bannière de débogage
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Note> notes = [];

  @override
  void initState() {
    super.initState();
    _fetchNotes();
  }

  Future<void> _fetchNotes() async {
    final response = await http.get(Uri.parse('http://127.0.0.1:8000/api/note'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      final List<dynamic> noteData = responseData['note'];
      final List<Note> noteList = noteData.map((data) => Note(
        titre: data['titre'],
        contenu: data['contenu'],
        noteId: data['id'],
      )).toList();

      setState(() {
        notes = noteList;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Note'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            color: Colors.grey.shade200,
            padding: EdgeInsets.all(16),
            child: const Row(
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
          Container(
            padding: EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            child: const Row(
              children: <Widget>[
                Text(
                  'Note récente',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: notes.length,
              itemBuilder: (context, index) {
                final note = notes[index];
                return Dismissible(
                  key: Key(note.noteId.toString()),
                  onDismissed: (direction) {  //glisser vers la gauche pour supprimer
                    setState(() {
                      notes.removeAt(index);
                    });
                  },
                  background: Container(  // couleur rouge pour supprimer
                    color: Colors.red,
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.only(right: 20.0),
                    child: const Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                  ),
                  child: MesNote(
                    titre: note.titre,
                    contenu: note.contenu,
                    noteId: note.noteId,
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => MyShowPage(),
          ));
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}

class Note {
  final String titre;
  final String contenu;
  final int noteId;

  Note({required this.titre, required this.contenu, required this.noteId});
}

class MesNote extends StatelessWidget {
  final String titre;
  final String contenu;
  final int noteId;

  MesNote({required this.titre, required this.contenu, required this.noteId});

  String get limitContenu {
    return contenu.length <= 10 ? contenu : contenu.substring(0, 10) + "...";
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 7,
      shadowColor: Colors.black,
      margin: EdgeInsets.all(7),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(9),
      ),
      child: ListTile(
        title: Text(titre),
        subtitle: Text(limitContenu),
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => MyReadPage(noteId: noteId),
          ));
        },
      ),
    );
  }
}