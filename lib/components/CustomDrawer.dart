import 'package:controle_de_gastos/pages/NewItemPage.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatefulWidget {
  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const SafeArea(
            child: DrawerHeader(
                decoration: BoxDecoration(
                    color: Color(0xfff4fef8),
                    image: DecorationImage(
                        image: AssetImage('assets/image/menuImage.png'))),
                child: Text("")),
          ),
          ListTile(
            selected: _selectedIndex == 1,
            tileColor: const Color(0xff146073),
            leading: const Icon(
              Icons.home,
              color: Colors.white,
            ),
            title: const Text(
              "Home",
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
              ),
            ),
            onTap: () {
              _onItemTapped(1);
              Navigator.pop(context);
            },
          ),
          ListTile(
            selected: _selectedIndex == 2,
            tileColor: Colors.white,
            leading: const Icon(
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
              _onItemTapped(2);

              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const NewItemPage()),
              );
            },
          ),
          ListTile(
            selected: _selectedIndex == 3,
            leading: const Icon(Icons.add_chart, color: Colors.black),
            title: const Text(
              'Relatórios',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
            ),
            onTap: () {
              _onItemTapped(3);
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
