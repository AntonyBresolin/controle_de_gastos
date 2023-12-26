
import 'package:flutter/material.dart';
class TypeGasto {
  int id;
  String name;
  Color color;

  TypeGasto({this.id = 0, this.name = '', required this.color});

  static TypeGasto defaultGasto() {
    return TypeGasto(color: Colors.black);
  }
}