import 'package:flutter/widgets.dart';

class Pessoa {
  final String id;
  final String name;
  final num idade;
  final String email;

  const Pessoa({
    required this.id,
    required this.name, 
    required this.idade, 
    required this.email,
  });

}