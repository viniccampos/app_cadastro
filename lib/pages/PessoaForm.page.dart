import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Models/pessoas.model.dart';
import '../Provider/pessoas.provider.dart';

class PessoaForm extends StatefulWidget {
  @override
  _PessoaFormState createState() => _PessoaFormState();
}

class _PessoaFormState extends State<PessoaForm> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerIdade = TextEditingController();
  final TextEditingController _controllerEmail = TextEditingController();

  final FocusNode _focusIdade = FocusNode();
  final FocusNode _focusEmail = FocusNode();

  final Map<String,dynamic> _formData = {};

  //Essa fuunção só será usada quando for editar
  void alterarPessoa(Pessoa pessoa){
    if(pessoa != null) {
      _formData['id'] = pessoa.id;
      _formData['name'] = pessoa.name;
      _formData['idade'] = pessoa.idade.toString();
      _formData['email'] = pessoa.email;

      _controllerName.text = pessoa.name;
      _controllerIdade.text = pessoa.idade.toString();
      _controllerEmail.text = pessoa.email;
      
    }
  }

    

  @override
  Widget build(BuildContext context) {
    var save;
    var textInputType = TextInputType;
    var name;
    return Scaffold(
      appBar: AppBar(
        title: Text("Formulário para Cadastro"),
        actions: [
          IconButton(
            icon: Icon(save),
            onPressed: () => addOuAlterar(),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(18),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: "Nome"),
                controller: _controllerName,
                keyboardType: TextInputType.name,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Informe um nome!";
                  } else {
                      return null;
                  }
                },
                focusNode: _focusIdade,
                onFieldSubmitted: (_) =>
                    FocusScope.of(context).requestFocus(_focusIdade),
                onSaved: (value) => _formData['nome'] = value!.trim(),
              ),
              TextFormField(
                // ignore: prefer_const_constructors
                decoration: InputDecoration(labelText: "Idade"),
                controller: _controllerIdade,
                // ignore: prefer_const_constructors
                keyboardType: TextInputType.numberWithOptions(
                  decimal: false,
                  signed: false,
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Informe a idade!";
                  } else {
                      return null;
                  }
                },
                focusNode: _focusEmail,
                onFieldSubmitted: (_) =>
                    FocusScope.of(context).requestFocus(_focusIdade),
                onSaved: (value) => _formData['idade'] = num.parse(value!.trim()),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Email"),
                controller: _controllerEmail,
                keyboardType: TextInputType.name,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Informe seu email!";
                  } else {
                      return null;
                  }
                },
                onFieldSubmitted: (_) => addOuAlterar(),
                onSaved: (value) => _formData['email'] = value!.trim(),
              ),
            ],
          ),
        ),
      )
    );
  }

  void addOuAlterar() {
    final isValid = _formKey.currentState!.validate();

    if (isValid) {
      _formKey.currentState!.save();
      Provider.of<PessoasProvider>(
        context,
        listen: false,
      ).put(
        Pessoa(
          id: _formData['id'],
          name: _formData['name'],
          idade: _formData['idade'],
          email: _formData['email'],
        ),
      );
      Navigator.of(context).pop();
    }
  }
}