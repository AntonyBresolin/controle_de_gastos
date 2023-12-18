import 'package:controle_de_gastos/components/DropdownMenuExample.dart';
import 'package:flutter/material.dart';

const List<String> list = <String>[
  'Selecione um item',
  'Despesa',
  'Salario',
  'Lucro',
  'Four'
];

List<Gasto> gastos = <Gasto>[
  Gasto(
      id: 1,
      name: 'Despesa',
      value: 100.0,
      type: 'Despesa',
      date: '01/01/2021'),
  Gasto(
      id: 2,
      name: 'Salario',
      value: 100.0,
      type: 'Salario',
      date: '01/01/2021'),
  Gasto(id: 3, name: 'Lucro', value: 100.0, type: 'Lucro', date: '01/01/2021'),
  Gasto(
      id: 4,
      name: 'Despesa',
      value: 100.0,
      type: 'Despesa',
      date: '01/01/2021'),
  Gasto(
      id: 5,
      name: 'Salario',
      value: 100.0,
      type: 'Salario',
      date: '01/01/2021'),
  Gasto(id: 6, name: 'Lucro', value: 100.0, type: 'Lucro', date: '01/01/2021'),
  Gasto(
      id: 7,
      name: 'Despesa',
      value: 100.0,
      type: 'Despesa',
      date: '01/01/2021'),
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
        title: const Text(
          'Controle de Gastos',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xff146073),
      ),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          AddNewSpentButton(),
          HistoryItem(),
        ],
      ),
      floatingActionButton: FloatingActionButton.large(
          onPressed: () {
            printarLista();
          },
          backgroundColor: const Color(0xfff6f6f6),
          child: const Icon(
            Icons.add,
            size: 64,
            color: Color(0xff146073),
          )),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xff146073),
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
                MaterialPageRoute(builder: (context) => NewItemPage()),
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

class NewItemPage extends StatelessWidget {
  const NewItemPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Adicionar novo débito"),
        backgroundColor: const Color(0xff146073),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
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
                          borderRadius: BorderRadius.circular(10.0)),
                      labelText: 'Insira um valor',
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: DropdownMenuExample(),
              ),
            ],
          ),
          const SliderAmount(),
          Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: FilledButton(
              onPressed: () {},
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.lightGreen),
                  fixedSize:
                      MaterialStateProperty.all(const Size.fromWidth(250))),
              child: const Text("Adicionar"),
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
  Widget build(BuildContext context) {
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

class HistoryItem extends StatelessWidget {
  const HistoryItem({super.key});

  @override
  Widget build(BuildContext context) {
    return (gastos.isEmpty
        ? const Padding(
            padding: EdgeInsets.all(8.0),
            child:
                Text("Nenhum gasto adicionado", style: TextStyle(fontSize: 24)),
          )
        : const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("Existem coisas adicionadas",
                style: TextStyle(fontSize: 24)),
          ));
  }
}

class AddNewSpentButton extends StatelessWidget {
  const AddNewSpentButton({super.key});
  @override
  Widget build(BuildContext context) {
    return (Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.add,
              size: 64,
              color: Color(0xff146073),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Adicione um novo gasto",
                style: TextStyle(fontSize: 24),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}

class Gasto {
  int id;
  String name;
  double value;
  String type;
  String date;

  Gasto(
      {this.id = 0,
      this.name = '',
      this.value = 0.0,
      this.type = '',
      this.date = ''});
}

void printarLista() {
  print(gastos.isEmpty);
  for (var gasto in gastos) {
    print(gasto.name);
  }
}
