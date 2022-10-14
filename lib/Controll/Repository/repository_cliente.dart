import 'package:bloc/Model/Cliente/cliente.dart';

class ClientRepository {
  final List<Client> _client = [];
  List<Client> carregarClientes() {
    _client.addAll([
      Client(nome: "Joao"),
      Client(nome: "Poly"),
      Client(nome: "Ezaquiel"),
      Client(nome: "Miguel"),
      Client(nome: "Adeuz"),
      Client(nome: "Marcelo")
    ]);
    return _client;
  }
  List<Client> addCliente(Client cliente){
    _client.add(cliente); 
    return _client;
  }
  List<Client> removerCliente(Client cliente){
    _client.remove(cliente);
    return _client;
  }
}
