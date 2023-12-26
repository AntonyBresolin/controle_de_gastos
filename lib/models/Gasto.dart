import 'package:controle_de_gastos/models/TypeGasto.dart';

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

enum Status { entrada, saida }
