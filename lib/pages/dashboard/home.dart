import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final Pink =Color(0xFFF8E4EA);
    final darkPink=Color(0xFFF1286B);
    final maroon=Color(0xFFB72C41);
    final babyPink=Color(0xFFFB5E9A);
    final cream=Color(0xFFDE9E3D);

    return Scaffold(
      backgroundColor: Color.fromRGBO(64, 140, 125, 1),
      appBar: AppBar(
          backgroundColor: Color.fromRGBO(64, 140, 125, 1),
          title: Text('Nirajan Singh'),
          // leading: const Icon(
          //   Icons.menu,
          // ),

          actions: <Widget>[
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.account_circle,
                color: Colors.white,
              ),
            )
          ]),
      drawer: Drawer(
        backgroundColor: const Color.fromRGBO(64, 140, 125, 1),
        // ignore: prefer_const_literals_to_create_immutables
        child: ListView(children: [
          // ignore: prefer_const_constructors
          DrawerHeader(
              child: const DrawerHeader(
                  child: Text(
            "Friendly Faces",
            style: TextStyle(color: Colors.white, fontSize: 50),
          ))),
          const ListTile(
            title: Text("Home",
                style: TextStyle(color: Colors.white, fontSize: 20)),
          ),
          const ListTile(
              title: Text("Connection",
                  style: TextStyle(color: Colors.white, fontSize: 20))),
          const ListTile(
              title: Text("Settings",
                  style: TextStyle(color: Colors.white, fontSize: 20)))
        ]),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 550,
            child: Center(
              child: ClipOval(
                child: Image.asset(
                  'assets/images/project-icon.jpg',
                  height: 250,
                  width: 250,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          
          
          Container(
            child: const SizedBox(
              child: Text(
                "Friendly Faces",
                style: TextStyle(color: Colors.white, fontSize: 26),
              ),
            ),
          ),
          const Text("Friend is just around the corner",
              style: TextStyle(color: Colors.white, fontSize: 16))
        ],
      ),
    );
  }
}
