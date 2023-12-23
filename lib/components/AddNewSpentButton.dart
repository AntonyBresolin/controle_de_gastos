import 'package:flutter/material.dart';

class AddNewSpentButton extends StatelessWidget {
  const AddNewSpentButton({super.key});
  @override
  Widget build(BuildContext context) {
    return (Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Text(
                "Semanal",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Text(
                "R\$ 300",
                style: TextStyle(color: Colors.green),
              )
            ],
          ),
          Column(
            children: [
              Text(
                "Mensal",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Text(
                "R\$ -400",
                style: TextStyle(color: Colors.red),
              )
            ],
          ),
          Column(
            children: [
              Text(
                "Anual",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "R\$ -400",
                style: TextStyle(color: Colors.red),
              )
            ],
          ),
        ],
      ),
    ));
  }
}
