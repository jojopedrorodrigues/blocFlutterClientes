import 'dart:async';

import 'package:bloc/Controll/Events/cliente_events.dart';
import 'package:bloc/Controll/Repository/repository_cliente.dart';
import 'package:bloc/Controll/State/cliente_state.dart';
import 'package:bloc/Model/Cliente/cliente.dart';

class ClienteBloc {
  final _clientRepository = ClientRepository(); //Recuperar dados
  final StreamController<ClienteEvent> _inputClienteController =
      StreamController<
          ClienteEvent>(); //Executa os eventos como adicionar e etc
  final StreamController<ClienteState> _outputClienteController =
      StreamController<ClienteState>(); //Mostra os dados output
  Sink<ClienteEvent> get addCliente => _inputClienteController.sink;
  Stream<ClienteState> get stream => _outputClienteController.stream;
  ClienteBloc() {
    _inputClienteController.stream.listen((_mapEventToState));
  }
_mapEventToState(ClienteEvent event){
  List<Client> clients = []; 
  if(event is LoadClienteEvent){ //Se cliente event esta carregando cliente, encher a lista cliente com a func carregarClientes
    clients = _clientRepository.carregarClientes();
  } else if( event is AddClienteEvent){
    clients = _clientRepository.addCliente(event.cliente);
  }
  else if( event is RemoveClienteEvent){
    clients = _clientRepository.removerCliente(event.cliente);
  }
  _outputClienteController.add(ClienteSucessState(clients: clients)); //Passando os clientes já preenchidos quando der Sucess para exibição
}

}
