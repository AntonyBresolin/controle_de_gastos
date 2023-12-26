import 'package:controle_de_gastos/components/CustomBottomNavigateBar.dart';
import 'package:controle_de_gastos/components/CustomDrawer.dart';
import 'package:controle_de_gastos/pages/HomePage.dart';
import 'package:controle_de_gastos/pages/NewItemPage.dart';
import 'package:flutter/material.dart';

void main() => runApp(MainScreen());

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    NewItemPage(),
    // Adicione mais páginas se necessário
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.grey,
        ),
        home: Scaffold(
          drawer: CustomDrawer(),
          appBar: AppBar(
            iconTheme: const IconThemeData(color: Colors.white),
            title: const Text(
              'Controle de Gastos',
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: const Color(0xff130D33),
          ),
          body: IndexedStack(
            index: _selectedIndex,
            children: _pages,
          ),
          bottomNavigationBar: CustomBottomNavigateBar(
            currentIndex: _selectedIndex,
            onItemSelected: _onItemTapped,
          ),
        ));
  }
}
