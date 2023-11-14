import 'package:ejemplos_2do_soft_9010/pedidos/dominio/repositorios.dart';

import '../dominio/entidades.dart';

class AdaptadorMemoriaRepositorioPedidos implements RepositorioDePedidos {
  final List<Pedido> _pedidos = [];
  final List<Comida> _comidas = [
    Comida(nombre: 'Milanesa', precio: 2500),
    Comida(nombre: 'Hamburguesa', precio: 1800),
    Comida(nombre: 'Pancho', precio: 500),
    Comida(nombre: 'Papas Rusticas', precio: 2100),
    Comida(nombre: 'Lomo', precio: 2500),
    Comida(nombre: 'Pizza', precio: 2300),
    Comida(nombre: 'Choripan', precio: 2300),
    Comida(nombre: 'Ravioles', precio: 2000),
    Comida(nombre: 'Asado', precio: 4000),
    Comida(nombre: 'Mila Napolitana', precio: 2300),
    Comida(nombre: 'Ramen', precio: 2300),
    Comida(nombre: 'Tacos', precio: 2500),
    Comida(nombre: 'Ratatouille', precio: 2300)
  ];

  @override
  guardarPedido(Pedido unPedido) {
    _pedidos.add(unPedido);
  }

  @override
  List<Pedido> obtenerPedidosQueContengaDeterminadaComida(Comida unaComida) {
    return _pedidos
        .where((pedido) => pedido.contieneComida(unaComida))
        .toList();
  }

  @override
  guardarComida(Comida unaComida) {
    _comidas.add(unaComida);
  }

  @override
  List<Comida> obtenerTodasLasComidas() {
    return _comidas;
  }

  @override
  List<Pedido> obtenerTodosLosPedidos() {
    return _pedidos;
  }

  @override
  int obtenerProximoNumeroDePedido() {
    return _pedidos.length;
  }
}
