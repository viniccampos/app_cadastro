// ignore_for_file: prefer_const_constructors, unused_label

import 'package:app_cadastro/Provider/pessoas.provider.dart';
import 'package:app_cadastro/Routes/app.routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Widgets/Listpessoa.widget.dart';

class HomePage extends StatelessWidget {
  get colorCodes => null;
  get entries => null;

  @override
  Widget build(BuildContext context) {
    final PessoasProvider pessoasProvider = Provider.of(context);
    double width = MediaQuery.of(context).size.width;
    double heigth = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          title: Text("Cadastros"),
        ),
        floatingActionButton:
         FloatingActionButton(child: Icon(Icons.add), onPressed: () => Navigator.of(context).pushNamed(AppRoutes.PESSOA_FORM)),
         );
        // ignore: dead_code
        body: pessoasProvider.count == 0
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Text(":(", style: TextStyle(fontSize: 80,fontWeight: FontWeight.bold,
                    ),
                  ), 
                  Text(
                    "Não há nenhum cadastro!",
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ],
              ),
            )
          : SingleChildScrollView(
            // ignore: sized_box_for_whitespace
            child: Container(
              width:  width,
              height: heigth,
              child: ListView.builder(
                itemCount: pessoasProvider.count,
                itemBuilder: (context, index) => ListPessoas(
                  pessoasProvider.byIndex(index),
                ),
              ),
            ),
          );
    // ignore: empty_statements
  }
}
