import 'package:flutter/material.dart';
import 'package:bloc_notes/home.dart';


class MyAjoutPage extends StatelessWidget {
  const MyAjoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(' Notes'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            ElevatedButton(
              onPressed: () {
                  //  Vous utilisez Provider.of pour accéder à l'instance de CounterProvider
              },

              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.pink),

              ),
              child: Icon(Icons.add),
            ),

            SizedBox(height: 40),

            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => MyHomePage(),
                ));
              },
              child: Icon(Icons.arrow_forward),
            ),
          ],
        ),
      ),
    );
  }
}