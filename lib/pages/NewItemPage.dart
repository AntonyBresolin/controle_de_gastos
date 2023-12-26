import 'package:controle_de_gastos/components/DropdownMenuExample.dart';
import 'package:controle_de_gastos/components/SliderAmount.dart';
import 'package:controle_de_gastos/main.dart';
import 'package:flutter/material.dart';

class NewItemPage extends StatelessWidget {
  const NewItemPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
            child: ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.lightGreen),
              ),
              child: const Text("Adicionar"),
            ),
          ),
        ],
      ),
    );
  }
}
