import 'package:bloc/Model/Cliente/cliente.dart';

abstract class ClienteEvent{ 

}
class LoadClienteEvent extends ClienteEvent{ //Carregar a lista de clientes

}

class AddClienteEvent extends ClienteEvent{  //adicionar novos cliente a lista
  Client cliente; 
  AddClienteEvent({required this.cliente}); 
}

class RemoveClienteEvent extends ClienteEvent{  //adicionar novos cliente a lista
  Client cliente; 
  RemoveClienteEvent({required this.cliente}); 
}