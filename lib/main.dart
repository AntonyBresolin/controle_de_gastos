import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            SafeArea(
              child: const DrawerHeader(
                  decoration: BoxDecoration(
                      color: Color(0xfff4fef8),
                      image: DecorationImage(
                          image: AssetImage('assets/image/menuImage.png'))),
                  child: Text("")),
            ),
            ListTile(
              tileColor: Color(0xff146073),
              leading: Icon(
                Icons.home,
                color: Colors.white,
              ),
              title: Text(
                "Home",
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              tileColor: Colors.white,
              leading: Icon(
                Icons.add,
                color: Colors.black,
                size: 28,
              ),
              title: const Text(
                'Adicionar novo gasto',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.add_chart, color: Colors.black),
              title: const Text(
                'Relatórios',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Controle de Gastos'),
        backgroundColor: Color(0xff146073),
      ),
      body: Center(
        child: Text('Side Menu Tutorial'),
      ),
      floatingActionButton: FloatingActionButton.large(
        onPressed: () {},
        child: Icon(
          Icons.add,
          size: 64,
          color: Color(0xff146073),
        ),
        backgroundColor: Color(0xfff6f6f6),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xff146073),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.white,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.add_chart,
                color: Colors.white,
              ),
              label: 'Relatórios')
        ],
        selectedItemColor: Colors.white,

      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
