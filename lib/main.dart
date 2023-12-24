import 'package:controle_de_gastos/components/AddNewSpentButton.dart';
import 'package:controle_de_gastos/components/CustomDrawer.dart';
import 'package:controle_de_gastos/components/DropdownMenuExample.dart';
import 'package:controle_de_gastos/pages/NewItemPage.dart';
import 'package:flutter/material.dart';

List<TypeGasto> tiposDeGastos = [
  TypeGasto(id: 1, name: 'Despesa', color: Colors.red),
  TypeGasto(id: 2, name: 'Salario', color: Colors.green),
  TypeGasto(id: 3, name: 'Lucro', color: Colors.blue),
  TypeGasto(id: 4, name: 'Investimento', color: Colors.orange),
  TypeGasto(id: 5, name: 'Aluguel', color: Colors.yellow),
];
List<Gasto> gastos = <Gasto>[
  Gasto(
      id: 1,
      name: 'Mercado',
      value: 108.0,
      type: tiposDeGastos[0], // Despesa
      date: '01/01/2021',
      status: Status.saida),
  Gasto(
      id: 2,
      name: 'Salário',
      value: 2500.0,
      type: tiposDeGastos[1],
      date: '05/01/2021',
      status: Status.entrada),
  Gasto(
      id: 3,
      name: 'Aluguel',
      value: 800.0,
      type: tiposDeGastos[4],
      date: '10/01/2021',
      status: Status.saida),
  Gasto(
      id: 4,
      name: 'Venda de Ações',
      value: 1200.0,
      type: tiposDeGastos[2],
      date: '15/01/2021',
      status: Status.entrada),
  Gasto(
      id: 5,
      name: 'Compra de Equipamentos',
      value: 450.0,
      type: tiposDeGastos[0],
      date: '20/01/2021',
      status: Status.saida),
  Gasto(
      id: 6,
      name: 'Restaurante',
      value: 120.0,
      type: tiposDeGastos[0],
      date: '25/01/2021',
      status: Status.saida),
  Gasto(
      id: 7,
      name: 'Investimento em CDB',
      value: 1000.0,
      type: tiposDeGastos[3],
      date: '01/02/2021',
      status: Status.entrada),
  Gasto(
      id: 8,
      name: 'Conta de Luz',
      value: 200.0,
      type: tiposDeGastos[0],
      date: '05/02/2021',
      status: Status.saida),
  Gasto(
      id: 9,
      name: 'Salário',
      value: 2500.0,
      type: tiposDeGastos[1],
      date: '05/02/2021',
      status: Status.entrada),
  Gasto(
      id: 10,
      name: 'Assinatura de Streaming',
      value: 30.0,
      type: tiposDeGastos[0],
      date: '10/02/2021',
      status: Status.saida),
];

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.grey,
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
        iconTheme: const IconThemeData(color: Colors.white),
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
        unselectedItemColor: Colors.grey,
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
              ),
              label: 'Relatórios')
        ],
        selectedItemColor: Colors.white,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
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
        : Expanded(
            flex: 1,
            child: ListView.builder(
              itemCount: gastos.length,
              itemBuilder: (context, index) {
                return Container(
                  color: Color.fromARGB(255, 232, 228, 228),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 6.0, right: 10.0, left: 10.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.0),
                        color: Color.fromARGB(255, 250, 249, 249),
                        border: const Border(
                            bottom: BorderSide(color: Colors.grey, width: 0.8)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    gastos[index].status == Status.entrada
                                        ? const Icon(
                                            Icons.north_east,
                                            color: Colors.green,
                                            size: 56.0,
                                          )
                                        : const Icon(
                                            Icons.south_east,
                                            color: Colors.red,
                                            size: 56.0,
                                          ),
                                    Expanded(
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                gastos[index].type.name,
                                                style: TextStyle(
                                                  shadows: [
                                                    Shadow(
                                                      // Simula o preenchimento do texto
                                                      blurRadius: 3.0,
                                                      color: gastos[index]
                                                          .type
                                                          .color,
                                                    ),
                                                  ],
                                                  foreground: Paint()
                                                    ..style = PaintingStyle.fill
                                                    ..filterQuality =
                                                        FilterQuality.high
                                                    ..color = Colors.black,
                                                ),
                                                textAlign: TextAlign.start,
                                                overflow: TextOverflow.fade,
                                                maxLines: 1,
                                                softWrap: false,
                                              ),
                                              Text(
                                                gastos[index].name,
                                                overflow: TextOverflow.fade,
                                                maxLines: 1,
                                                softWrap: false,
                                                style: const TextStyle(
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(
                                                gastos[index].date,
                                                style: const TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 152, 148, 148)),
                                              ),
                                            ]),
                                      ),
                                    ),
                                  ]),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                gastos[index].status == Status.entrada
                                    ? "${gastos[index].value}"
                                    : "- ${gastos[index].value}",
                                style: (gastos[index].status == Status.entrada
                                    ? const TextStyle(
                                        color: Color.fromARGB(255, 42, 42, 42),
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold)
                                    : const TextStyle(
                                        color: Color.fromARGB(255, 203, 27, 15),
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ));
  }
}

enum Status { entrada, saida }

class Gasto {
  int id;
  String name;
  double value;
  TypeGasto type;
  String date;
  Status status = Status.saida;

  Gasto(
      {this.id = 0,
      this.name = '',
      this.value = 0.0,
      required this.type,
      this.date = '',
      this.status = Status.saida});
}

class TypeGasto {
  int id;
  String name;
  Color color;

  TypeGasto({this.id = 0, this.name = '', required this.color});

  static TypeGasto defaultGasto() {
    return TypeGasto(color: Colors.black);
  }
}

const List<String> list = <String>[
  'Selecione um item',
  'Despesa',
  'Salario',
  'Lucro',
  'Four'
];

void printarLista() {
  print(gastos.isEmpty);
  for (var gasto in gastos) {
    print(gasto.name);
  }
}
