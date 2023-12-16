import 'package:controle_de_gastos/components/DropdownMenuExample.dart';
import 'package:flutter/material.dart';

const List<String> list = <String>[
  'Selecione um item',
  'Despesa',
  'Salario',
  'Lucro',
  'Four'
];

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
      drawer: CustomDrawer(),
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
          SafeArea(
            child: const DrawerHeader(
                decoration: BoxDecoration(
                    color: Color(0xfff4fef8),
                    image: DecorationImage(
                        image: AssetImage('assets/image/menuImage.png'))),
                child: Text("")),
          ),
          ListTile(
            selected: _selectedIndex == 1,
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
              _onItemTapped(1);
              Navigator.pop(context);
            },
          ),
          ListTile(
            selected: _selectedIndex == 2,
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
              _onItemTapped(2);

              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NewItemPage()),
              );
            },
          ),
          ListTile(
            selected: _selectedIndex == 3,
            leading: Icon(Icons.add_chart, color: Colors.black),
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

class NewItemPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Adicionar novo débito"),
        backgroundColor: Color(0xff146073),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                "Adicionar\n uma nova entrada",
                style: TextStyle(
                  fontSize: 32,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0)
                      ), labelText: 'Insira um valor', ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownMenuExample(),
              ),
            ],
          ),
          SliderAmount(),
          Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: FilledButton(
                onPressed: () { },
                child: const Text("Adicionar"),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.lightGreen),
                  fixedSize: MaterialStateProperty.all(Size.fromWidth(250))
                ),
            ),
          )
        ],
      ),
    );
  }
}

class SliderAmount extends StatefulWidget {
  const SliderAmount({super.key});

  @override
  State<SliderAmount> createState() => _SliderAmountState();
}

class _SliderAmountState extends State<SliderAmount> {
  double _currentSliderValue = 0;

  @override
  Widget build(BuildContext context){
    return Slider(
        value: _currentSliderValue,
        max: 1000,
        divisions: 1000,
        label: _currentSliderValue.round().toString(),
        onChanged: (double value) {
          setState(() {
            _currentSliderValue = value;
          });
        },
    );
  }
}

