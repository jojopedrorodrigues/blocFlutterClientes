import '../../Model/Cliente/cliente.dart';

abstract class ClienteState {
  List<Client> clientes;
  ClienteState({required this.clientes});
}
class ClienteInitialState extends ClienteState{  //Como o clienteState requer uma lista e esta e uma classe inicial se passa um array vazio
  ClienteInitialState() : super(clientes: []);
}
class ClienteSucessState extends ClienteState {
  ClienteSucessState({required List<Client> clients}): super(clientes: clients);  //Quando carregar com sucesso já passa a lista cheia
}