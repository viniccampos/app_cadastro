import 'dart:math';

import 'package:app_cadastro/Data/Database.dart';
import 'package:app_cadastro/Models/pessoas.model.dart';
import 'package:flutter/material.dart';

class PessoasProvider with ChangeNotifier {
  final Map<String, Pessoa> _items = {...dataPessoa}; 

// Retornar todos os cadastrados!
  List<Pessoa> get all {
    return [..._items.values];
  }

// Retorna a quantidade de cadastrados!
  int get count {
    return _items.length;
  }

// Retorna o cadastrado pelo index!
  Pessoa byIndex(int index) {
    return _items.values.elementAt(index);
  }

// Vamos alterar ou adicionar um novo cadastro!
  void put(Pessoa pessoa) {
    if (pessoa == null) {
      return;
    }

    if (pessoa.id != null && pessoa.id.trim().isNotEmpty && _items.containsKey(pessoa.id) ){

    // Ele apenas entrará nesta coondição se o id seja dirferente ou nulo
      _items.update(
        pessoa.id,
        (_) => Pessoa(
          id: pessoa.id,
          name: pessoa.name,
          idade: pessoa.idade,
          email: pessoa.email,
          ),
        );

    }else {

      final id = Random()
        .nextDouble()
        .toString(); // o id será gerado de forma rondonica
      _items.putIfAbsent(id,
       () => Pessoa(
          id: id,
          name: pessoa.name,
          idade: pessoa.idade,
          email: pessoa.email,
        ),
      );
      notifyListeners(); //este metodo nootifica o provider e atualiza o aplicação com o novo dado

    }
  }

  // removerá o cadastro seelecionado
  void remove(Pessoa pessoa){
    if(pessoa != null && pessoa.id !=null){
      _items.remove(pessoa.id);
      notifyListeners();
    }
  }
}