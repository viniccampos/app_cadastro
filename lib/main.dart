import 'package:app_cadastro/Provider/pessoas.provider.dart';
import 'package:app_cadastro/Routes/app.routes.dart';
import 'package:app_cadastro/pages/Home.page.dart';
import 'package:app_cadastro/pages/PessoaForm.page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => PessoasProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.pink,
          primarySwatch: Colors.green,
        ),
        home: HomePage(),
        routes: {
          AppRoutes.PESSOA_FORM: (_) => PessoaForm(),
        },
      ),
    );
  }
}

