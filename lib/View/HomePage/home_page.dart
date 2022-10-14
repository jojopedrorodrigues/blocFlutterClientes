import 'dart:math';

import 'package:bloc/Controll/ClienteBloc/cliente_bloc.dart';
import 'package:bloc/Controll/Events/cliente_events.dart';
import 'package:bloc/Model/Cliente/cliente.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final ClienteBloc bloc;
  String geradorRandomName() {
    final randomName = Random();
    return ["Ione", "José", "Marcio","Ulisses", "Ariel", "Geraldo"].elementAt(randomName.nextInt(6));
  }

  @override
  void initState() {
    bloc = ClienteBloc();
    bloc.addCliente.add(LoadClienteEvent());

    super.initState();
  }

  @override
  void dispose() {
    bloc.addCliente.close();
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData query = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Aplicativo Cliente Bloc"),
        actions: [
          GestureDetector(
            onTap: () {
              bloc.addCliente.add(
                  AddClienteEvent(cliente: Client(nome: geradorRandomName())));
            },
            child: Icon(Icons.add_a_photo_outlined),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: StreamBuilder(
          builder: ((context, AsyncSnapshot snapshot) {
            final clientList = snapshot.data?.clientes ?? [];
            return ListView.separated(
                itemBuilder: ((context, index) {
                  return ListTile(
                    title: Text(clientList[index].nome),
                  );
                }),
                itemCount: clientList.length,
                separatorBuilder: (context, index) => const Divider());
          }),
          stream: bloc.stream,
        ),
      ),
    );
  }
}
