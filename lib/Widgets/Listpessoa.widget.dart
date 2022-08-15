// ignore_for_file: prefer_const_constructors

import 'package:app_cadastro/Models/pessoas.model.dart';
import 'package:app_cadastro/Provider/pessoas.provider.dart';
import 'package:app_cadastro/Routes/app.routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListPessoas extends StatelessWidget {
  final Pessoa pessoa;
  const ListPessoas(this.pessoa);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: Icon(Icons.home),
      ),
      title: Text(pessoa.name),
      subtitle: Text("Idade: ${pessoa.idade}"),
      trailing: Container(
        width: 100,
        child: Row(
          children: [
            IconButton(
              // ignore: prefer_const_constructors
              icon: Icon(
                Icons.edit,
                color: Colors.blue,
            ),
            onPressed: () {
              Navigator.of(context).pushNamed(
                AppRoutes.PESSOA_FORM,
                arguments: pessoa, //será passado a pessoa que for selecionado, para podermos edita-lá
              );
            },
          ),
            IconButton(
              // ignore: prefer_const_constructors
              icon: Icon(
                Icons.delete,
                color: Colors.red,
            ),
            onPressed: () {
              Provider.of<PessoasProvider>(
                context,
                listen: false,
              ).remove(pessoa);
            },
            ),
          ],
        ),
      ),
    );
  }
}